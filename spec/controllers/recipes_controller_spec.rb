require 'rails_helper'

RSpec.describe RecipesController, type: :request do
    
    describe 'POST /api/v1/recipes/create' do
        context 'request ok' do
            let(:recipe_params) { { name: "Receita de Massa", ingredients: "Farinha, Sal, Açúcar", directions: "Misture tudo. Asse por 10 minutos.", notes: "Rende 1 massa.", tags: "Massa"} }
            before { post "/api/v1/recipes/create", params: recipe_params }

            it 'create a recipe' do
                expect(response.body).not_to be_empty
                expect(JSON.parse(response.body)['data']['name']).to eq("Receita de Massa")
                expect(JSON.parse(response.body)['data']['ingredients']).to eq("Farinha, Sal, Açúcar")
                expect(JSON.parse(response.body)['data']['directions']).to eq("Misture tudo. Asse por 10 minutos.")
                expect(JSON.parse(response.body)['data']['notes']).to eq("Rende 1 massa.")
                expect(JSON.parse(response.body)['data']['tags']).to eq("Massa")
                
            end
        end

        context 'request not ok' do
            let(:recipe_params) { { directions: "Misture tudo. Asse por 10 minutos.", notes: "Rende 1 massa.", tags: "Massa"} }
            before { post "/api/v1/recipes/create", params: recipe_params }

            it 'try to create a invalid recipe' do
                expect(JSON.parse(response.body)['data']['name']).to eq("can't be blank")
                expect(JSON.parse(response.body)['data']['ingredients']).to eq("can't be blank")
            end
        end
    end

    describe 'UPDATE /api/v1/recipes/update' do
        context 'request update' do
            let(:recipe_params) { { id: 1, name: "Receita de Massa 2", ingredients: "Farinha 2, Sal 2, Açúcar 2", directions: "Misture tudo. Asse por 10 minutos 2.", notes: "Rende 1 massa 2.", tags: "Massa 2"} }
            before { post "/api/v1/recipes/update", params: recipe_params }

            it 'update a recipe' do
                expect(response.body).not_to be_empty
                expect(JSON.parse(response.body)['data']['name']).to eq("Receita de Massa 2")
                expect(JSON.parse(response.body)['data']['ingredients']).to eq("Farinha 2, Sal 2, Açúcar 2")
                expect(JSON.parse(response.body)['data']['directions']).to eq("Misture tudo. Asse por 10 minutos 2.")
                expect(JSON.parse(response.body)['data']['notes']).to eq("Rende 1 massa 2.")
                expect(JSON.parse(response.body)['data']['tags']).to eq("Massa 2")
                
            end
        end
    end

    describe 'DELETE /api/v1/recipes/delete' do
        context 'request delete' do
            let(:receipe_id) { { id: 1 } }
            before { delete "/api/v1/recipes/delete", params: receipe_id }

            it 'delete a recipe' do
                expect(response.body).not_to be_empty
                expect(JSON.parse(response.body)['data']['id']).to eq(1)
            end
        end

        context 'receipe not found' do
            let(:receipe_id) { { id: 100 } }
            before { delete "/api/v1/recipes/delete", params: receipe_id }

            expect(response.body).not_to be_empty
            expect(JSON.parse(response.body)['message']).to eq("Error finding recipe")
        end
    end

    describe 'GET api/v1/recipes/getRecipeByName' do
        context 'receipe found' do
            let(:recipe_name) { { name: "Receita de Bolo" } }
            before { get "api/v1/recipes/getRecipeByName", params: recipe_name }

            it 'get recipe by name' do
                expect(response.body).not_to be_empty
                expect(JSON.parse(response.body)['data']['name']).to eq("Receita de Bolo")
            end
        end

        context 'no receipe found' do
            let(:recipe_name) { { name: "Receita de Bolokajsdnakjad" } }
            before { get "api/v1/recipes/getRecipeByName", params: recipe_name }

            it 'no receipe found' do
                expect(response.body).not_to be_empty
                expect(JSON.parse(response.body)['message']).to eq("No recipe found")
            end
        end
    end

    describe 'GET api/v1/recipes/getRecipeByIngredientsList' do
        context 'receipe found' do
            let(:recipe_ingredients_list) { { ingredients: "Farinha,Açúcar" } }
            before { get "api/v1/recipes/getRecipeByIngredientsList", params: recipe_ingredients_list }

            it 'get recipe by ingredients list' do
                expect(response.body).not_to be_empty
                expect(JSON.parse(response.body)['data']['name']).to eq("Receita de Bolo")
            end
        end

        context 'no receipe found' do
            let(:recipe_ingredients_list) { { ingredients: "Test,Ingredient" } }
            before { get "api/v1/recipes/getRecipeByIngredientsList", params: recipe_ingredients_list }

            it 'no receipe found' do
                expect(response.body).not_to be_empty
                expect(JSON.parse(response.body)['message']).to eq("No recipe found")
            end
        end
    end

    describe 'GET api/v1/recipes/getRecipeByTag' do
        context 'receipe found' do
            let(:recipe_tag) { { tag: "Doce" } }
            before { get "api/v1/recipes/getRecipeByTag", params: recipe_tag }

            it 'get recipe by tag' do
                expect(response.body).not_to be_empty
                expect(JSON.parse(response.body)['data']['name']).to eq("Receita de Bolo")
            end
        end

        context 'no receipe found' do
            let(:recipe_tag) { { tag: "Doce Test" } }
            before { get "api/v1/recipes/getRecipeByTag", params: recipe_tag }

            it 'no receipe found' do
                expect(response.body).not_to be_empty
                expect(JSON.parse(response.body)['message']).to eq("No recipe found")
            end
        end
    end

end
