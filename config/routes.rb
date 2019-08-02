Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      post 'recipes/create', to: 'recipes#create'
      put 'recipes/update', to:  'recipes#update'
      delete 'recipes/delete', to: 'recipes#destroy'
      get 'recipes/getRecipeByName', to: 'recipes#getRecipeByName'
      get 'recipes/getRecipeByIngredientsList', to: 'recipes#getRecipeByIngredientsList'
      get 'recipes/getRecipeByTag', to: 'recipes#getRecipeByTag'
    end
  end
end
