class ArticleController < ApplicationController
    # befor perform any action in ArticleController check any auths is signed in
    before_action :authenticate_auth!
    # automatical load resource
    load_and_authorize_resource

    # GET /api/v1/article
    def index
        @articles = Article.order(created_at: :desc).paginate(page: params[:page], per_page: 4)
    end
    
    # GET /api/v1/article/new
    def new
    end
    
    # POST /api/v1/article
    def create
        @article = current_auth.articles.new(article_params)
        if @article.save
            redirect_to article_index_path
        else
            redirect_to new_article_path
        end
    end
    
    # GET /api/v1/article/:id
    def edit
    end
    
    # PUT/PATCH /api/v1/article/:id
    def update
        @article.update(article_params)
        redirect_to article_index_path
    end
    
    # GET /api/v1/article/:id
    def show
    end
    
    # DELETE /api/v1/article/:id
    def destroy
        @article.destroy
        redirect_to article_index_path
    end

    private
    # get article parameter's
    def article_params
        params.require(:article).permit(:title,:content)
    end

end
