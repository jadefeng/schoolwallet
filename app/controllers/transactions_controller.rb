class TransactionsController < ApplicationController

  def new
    gon.client_token = generate_client_token
  end

  def create
    @result = Braintree::Transaction.sale(
              amount: params[:amount],
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      # current_user.purchase_cart_movies!

      puts "FIRST current balance #{current_user.balance}"
      puts "This is the amounttttt"
      puts params[:amount]
      @user = User.find(current_user.id)
      @user.balance+=params[:amount].to_f #add the money to your account
      @user.save
      # current_user.save
      puts "AFTER current balance #{current_user.balance}"

      redirect_to user_path(current_user), notice: "Congraulations! Your transaction has been successfully!"
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :new
    end
  end

  private

  def generate_client_token
    Braintree::ClientToken.generate
  end


end