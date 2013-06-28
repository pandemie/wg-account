require 'calc'

class TransactionsController < ApplicationController
  include ApplicationHelper
  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
    @transaction = Transaction.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/new
  # GET /transactions/new.json
  def new
    @transaction = Transaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transactions }
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
  end

  # POST /transactions
  # POST /transactions.json
  def create
    original_params = params
    params[:transaction][:amount] = Calc.evaluate(params[:transaction][:amount].gsub(',','.'))
    @transaction = Transaction.new(params[:transaction])
    @transactions = Transaction.all

    @transaction.debtors = params[:new_debtors].collect { |d| FlatmateGroup.where(name: d).first } if params[:new_debtors]
    @transaction.creditors = params[:new_creditors].collect { |c| FlatmateGroup.where(name: c).first } if params[:new_creditors]

    respond_to do |format|
      if @transaction.save
        #write_transaction_to_log("create",@transaction)
        format.html { redirect_to transactions_url, notice: 'Transaction was successfully created.' }
        format.json { render json: transactions_url, status: :created, location: @transaction }
      else
        format.html { render "index" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.json
  def update
    @transaction = Transaction.find(params[:id])
    @attributes = {}

    @d   = { :debtors => params[:new_debtors].collect { |d| FlatmateGroup.where(name: d).first } } if params[:new_debtors]
    @c   = { :creditors => params[:new_creditors].collect { |c| FlatmateGroup.where(name: c).first } } if params[:new_creditors]

    if @d.nil?
      @attributes.update(:debtors => [])
    else
      @attributes.update(@d)
    end

    if @c.nil?
      @attributes.update(:creditors => [])
    else
      @attributes.update(@c)
    end

    @attributes.update(params[:transaction]) unless params[:transaction].nil?

    respond_to do |format|
      if @transaction.update_attributes(@attributes)
        write_transaction_to_log("update",@transaction)
        format.html { redirect_to transactions_url, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      write_transaction_to_log("delete",@transaction)
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end
end
