class CommentsController < ApplicationController
    
    #For security - deleting comments
    http_basic_authenticate_with name: "pedro", password: "3110", only: :destroy
    
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end
    
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end
 
      
    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end