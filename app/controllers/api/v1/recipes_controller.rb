module Api
    module V1
        class RecipesController < ApplicationController
            # Create a recipe [POST]
            def create
                recipe = Recipe.new(recipe_params)

                if recipe.save
                    render json: { status: 'SUCCESS', message: 'Recipe created!', data: recipe }, status: :ok
                else
                    render json: { status: 'ERROR', message: 'Error creating recipe', data: recipe.errors }, status: :unprocessable_entity
                end
            end

            # Update a recipe [PUT]
            def update
                begin
                    recipe = Recipe.find(params[:id])

                    if recipe.update_attributes(recipe_params)
                        render json: { status: 'SUCCESS', message: 'Recipe updated!', data: recipe }, status: :ok
                    else
                        render json: { status: 'ERROR', message: 'Error updating recipe', data: recipe.errors }, status: :unprocessable_entity
                    end
                rescue
                    render json: { status: 'ERROR', message: 'Error finding recipe', data: {} }, status: :not_found
                end
            end

            # Delete a recipe [DELETE]
            def destroy
                begin
                    recipe = Recipe.find(params[:id])

                    recipe.destroy
                    render json: { status: 'SUCCESS', message: 'Recipe deleted!', data: recipe }, status: :ok
                rescue
                    render json: { status: 'ERROR', message: 'Error finding recipe', data: {} }, status: :not_found
                end
            end
            
            # Retrieve a recipe by name [GET]
            def getRecipeByName
                begin
                    @recipe = Recipe.find_by(name: params[:name])

                    render json: { status: 'SUCCESS', message: 'Loaded recipe!', data: @recipe }, status: :ok
                rescue
                    render json: { status: 'ERROR', message: 'Error loading recipe', data: {} }, status: :not_found
                end
            end

            # Retrieve a recipe by ingredients list [GET]
            def getRecipeByIngredientsList
                begin
                    ingredientsList = params[:ingredients].split(",")

                    @recipe = []
                    ingredientsList.each do |ingredient|
                        @recipe.push(Recipe.where('ingredients ILIKE ?', '%'+ingredient+'%').all)
                    end
                    
                    if !@recipe.empty?
                        render json: { status: 'SUCCESS', message: 'Loaded recipe!', data: @recipe }, status: :ok
                    else
                        render json: { status: 'SUCCESS', message: 'No recipe found', data: {} }, status: :not_found
                    end
                rescue
                    render json: { status: 'ERROR', message: 'Error loading recipe', data: {} }, status: :not_found
                end
            end

            # Retrieve a recipe by tag [GET]
            def getRecipeByTag
                begin
                    @recipe = Recipe.where('tags ILIKE ?', '%'+params[:tag]+'%').all

                    if !@recipe.empty?
                        render json: { status: 'SUCCESS', message: 'Loaded recipe!', data: @recipe }, status: :ok
                    else
                        render json: { status: 'SUCCESS', message: 'No recipe found', data: {} }, status: :not_found
                    end
                rescue
                    render json: { status: 'ERROR', message: 'Error loading recipe', data: {} }, status: :not_found
                end
            end

            # Parameters Accepted
            private
            def recipe_params
                params.permit(:name, :ingredients, :directions, :notes, :tags)
            end
        end
    end
end