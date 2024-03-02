class SouvenirsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @souvenirs = Souvenir.where.not(user_id: 2)
        search = params[:search]
      if search.present?
        @souvenirs = @souvenirs.joins(:user).where("name LIKE ?", "%#{search}%")
      end
    end

    def new
      @souvenir = Souvenir.new
    end
    
    def create
      souvenir = Souvenir.new(souvenir_params)
      souvenir.user_id = current_user.id
      if souvenir.save!
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end

    def show
      @souvenir = Souvenir.find(params[:id])
    end
    
    def edit
      @souvenir = Souvenir.find(params[:id])
    end
    
    def update
      souvenir = Souvenir.find(params[:id])
      if souvenir.update(souvenir_params)
        redirect_to :action => "show", :id => souvenir.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      souvenir = Souvenir.find(params[:id])
      souvenir.destroy
      redirect_to action: :index
    end

    def ichiosi
      @souvenirs = Souvenir.where(user_id: 2)
    end
    
    private
    def souvenir_params
      params.require(:souvenir).permit(:name, :prefecture, :adress, :about, :image, :lat, :lng)
    end
end
