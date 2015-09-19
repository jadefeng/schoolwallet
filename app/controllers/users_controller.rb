class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy, :change_money]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show

    @user = User.find(params[:id])
    @children = Child.where(:user_id==current_user.id)
  end

  # Adding money to kids
  def change_money 
    @user = User.find(:id==params[:id])
    puts "RUNNING ADD MONEY"
    puts "THE CHILD ID HERE IS #{params[:child_id]}"
    @child = Child.find(params[:child_id])
    puts "THIS IS MONEY FOR #{@child.name}"
    @amount=params[:amount].to_f

    if (params[:add_money] )
      # Redirect to new form, for example.
      if @user.balance >= @amount # add the moneh
        @child.balance+=@amount
        @user.balance-=@amount
        @user.save
        @child.save
      else
        puts "fuck you doubly"
      end 
    else 
      if @child.balance >= @amount
        @child.balance-=@amount
        @user.balance+=@amount
        @user.save
        @child.save
      else 
        puts "fuck you"
      end


    end
      redirect_to user_path(current_user)
  end


  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'User was successfully created.'
    else
      render :new
    end
  end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def payment

    @client_token = Braintree::ClientToken.generate 
      # (:customer_id => current_user.id)

    # @client_token = Braintree::ClientToken.generate
    puts @client_token

    params.each do |key,value|
      Rails.logger.warn "Param #{key}: #{value}"
    end
  end  

  def checkout

    nonce = params[:payment_method_nonce]
    post nonce

    result = Braintree::Transaction.sale(
      :amount => "100.00",
      :payment_method_nonce => nonce_from_the_client
    )
    puts "HELLO CHECKING YOU OUT"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
