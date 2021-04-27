class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:search, :show]
  before_action :set_room, only: [:show, :update, :destroy]
  
  def search
    @rooms = Room.where("address LIKE ? AND description LIKE ?", "%#{params[:rooms_search][:area]}%", "%#{params[:rooms_search][:keyword]}%") # あいまい検索
    @rooms = Room.all if params[:rooms_search][:area] == nil && params[:rooms_search][:keyword] == nil # エリアかキーワードが空欄または両方とも空欄でも候補を表示させる
  end
  
  def index
    @rooms = Room.current_user.rooms.all #ログインユーザーの登録したroomsテーブルのレコードをすべて取得
  end
  
  def new
    @room = Room.new
  end
 
  def create
    @room = Room.new(room_params) #登録を押すとroom_paramsフォームに入力された値がインスタンス変数に代入される
    @room.maker = current_user # ログインユーザーのデータがmakerとしてインスタンスに追加される？
    
    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: "部屋が登録されました" } #登録完了後、showページにリダイレクトされて、ビューで用意したnoticeが表示される
        format.json { render :show, status: :created, location: @room } # urlに.jsonと追加するとjson形式で文字列が羅列される
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity } # json形式でエラーコードを表示？
      end
    end
  end
 
  def show
    @reservation = Reservation.new
    @reservation.room = @room
    @reservation.user = current_user
  end
 
  def edit
  end
 
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: "部屋が更新されました" }
        format.json { render :show, status: :ok, location:@room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  
  private
  
  
  def set_room
    @room = Room.find(params[:id])
  end
  
  def room_params
      params.require(:room).permit(:user_id, :new_room_img, :name, :description, :price, :address)
  end
  
end
