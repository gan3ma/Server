class PlaysController < ApplicationController
  before_action :set_play, only: [:state, :users, :get_winner, :show, :get_pieces]

  def state
    render "state", :formats => [:json], :handlers => [:jbuilder]
  end

  def users
    render "users", :formats => [:json], :handlers => [:jbuilder]
  end

  def show
    # 現在のターン数、観客の人数、状態を返す
    @watcher_count = PlayingUser.where( :play => @play, :role => 'watcher' ).count
    render "show", :formats => [:json], :handlers => [:jbuilder]
  end

  def get_winner
    render "winner", :formats => [:json], :handlers => [:jbuilder]
  end

  def get_pieces
    @pieces = Piece.where( :play => @play.id ).all
    # binding.pry
    render "pieces", :formats => [:json], :hanlders => [:jbuilder]
  end

  # 駒情報の更新
  def update
    # begin
      # 1. play_idとuser_idとmove_idでpiecesテーブルからデータを拾ってくる
      @p_move = Piece.where( :play_id => params[:play_id], :piece_id => params[:move_id] ).first
      # 2. posxとposyを更新
      @p_move.posx = params[:posx]
      @p_move.posy = params[:posy]
      # binding.pry
      @p_move.promote = (params[:promote] == "True")? true : false
      @p_move.save!

      # render :json => @p_move
      @play = Play.find(params[:play_id])

      # binding.pry
      # 3. get_idが-1かどうか確認
      if params[:get_id] != "-1"
        # 4. get_idが-1でない場合、play_idとget_idでpiecesテーブルからデータを拾ってくる
        if params[:get_id] != ""
          @p_get = Piece.where( :play_id => params[:play_id], :piece_id => params[:get_id] ).first
          # 5. posxとposyを更新して保存
          @p_get.posx = 0
          @p_get.posy = 0
          @p_get.promote = false
          @p_get.owner = params[:user_id]
          @p_get.save!
          # 6. get_idが39or40なら終了処理
          if params[:get_id] == "40" || params[:get_id] == "39"
            @play.winner = @play.turn_player
            @play.state = "finish"
            # 7. ルーム内全員を退出処理
            @users = PlayingUser.where( :play_id => params[:play_id] ).all
            @users.each do |user|
              user.exit_flag = true
              user.save!
            end
          end
        end
      end
      # 8. ターン数を増やす
      @play.turn_count += 1
      if @play.turn_player == @play.first_player 
        @play.turn_player = @play.last_player 
      else
        @play.turn_player = @play.first_player
      end
      @play.save!
      # レスポンスは成功したかしてないか
    @pieces = Piece.where( :play => @play.id ).all
    render "pieces", :formats => [:json], :hanlders => [:jbuilder]
    # rescue
    #   @error = "error!"
    #   render "user/error", :formats => [:json], :handlers => [:jbuilder]
    # end
  end

  # debug用
  def end
    @play = Play.find(params[:id])
    render 'state', :formats => [:json], :hanlders => [:jbuilder]
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_play
      begin
        @play = Play.find(params[:id])
      rescue
        @error = "record not found"
        render "users/error", :formats => [:json], :handlers => [:jbuilder] and return
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def play_params
      params.require(:play).permit(:turn_player, :turn_number, :end_flag, :room_no)
    end
end
