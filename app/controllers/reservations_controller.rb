class ReservationsController < ApplicationController
  before_action :authenticate_user! #アクションを探す前に、ログイン済みユーザーにのみアクセスを許可
  before_action :set_reservation, only: [:show, :edit, :update, :destroy] #カブるアクションをまとめて定義する
  
  def index
    @reservations = current_user.reservations.all #ログイン済ユーザーの予約しているルーム全てを取得
  end
  
  def new #予約内容確認ページ
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(id: @reservation.room_id)
    if (@reservation.start_date.blank? || @reservation.end_date.blank? || @reservation.number_of_people.blank?) ||
      @reservation.start_date < Date.today || @reservation.end_date < @reservation.start_date || @reservation.number_of_people <= 0
      redirect_to @room, alert: "開始日・終了日・人数を正しく入力してください"
    else
      @date_diff = (@reservation.end_date - @reservation.start_date).to_i # 終了日ー開始日の差を数字にして変数へ代入
      @reservation.total_amount = @room.price * @date_diff * @reservation.number_of_people # 値段×滞在日数×人数を変数に代入
    end
  end
 
  def create # 予約を確定ボタンを押すと実行
    @reservation = Reservation.new(reservation_params)
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: "予約が完了しました" } # reservationのshowページにリダイレクトして、noticeのメッセージを表示
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def show
  end
 
  def edit
  end
 
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content}
    end
  end
  
  
  
  private
  
  
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end
    
    def reservation_params
      params.require(:reservation).permit(:user_id, :room_id, :start_date, :end_date, :number_of_people, :total_amount)
    end
  
end
