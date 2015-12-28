
class ArticlesController < ApplicationController
    
    # For security
    http_basic_authenticate_with name: "pedro", password: "3110", except: [:index, :show]
    
    # There are public, private and protected methods in Ruby, but only
    # public methods can be actions for controllers.
    
    # /new.html.erb : html = format of the template
    #                 erb  = handler that will be used
    
    # Standard order: index, show, new, edit, create, update, destroy
    def index
        @articles = Article.all
    end
    
    def show
        # we pass the :id parameter from the request
        # we use an instance variable prefixed with a @ to hold a reference to the article object
        @article = Article.find(params[:id])
        # Rails will pass all instance variables to the - corresponding - view ( we will be able to 
        # use these variables in the view.html.erb)
    end
    
    def new 
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def create
        @article = Article.new(article_params)
        # Responsible for saving the model in the database. Returns a boolean indicating success
        if @article.save
            # Redirect user to the 'show' action
            redirect_to @article
        else
            # Render: the @article object is passed back to the new template when it is rendered,
            # and the render is done within the same request as the form submission; the redirect_to
            # would tell the browser to issue another request
            render 'new'
        end
    end
    
    def update
      @article = Article.find(params[:id])
     
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
    
        redirect_to articles_path
        # don't need to add a view because se redirect to the index action
        # We just need to add a 'destroy' link to the index template
    end
    
    private 
    def article_params
                params.require(:article).permit(:title, :text)
    end
    
end
