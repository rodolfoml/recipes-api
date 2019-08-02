# Recipes API

## Dependencies
* Ruby version :  ```2.6.3```
* Rails version: ```5.2.3```
* Postgres version: ```10.9```


## Installation

Clone the repository and run the following commands:

```
bundle install

rails db:migrate
```

## Run 

```
rails s
```

# Endpoints

  
## api/v1/recipes/create

**Method**: POST

  

Create a recipe.

  

```

{

"name": "Receita de Bolo",

"ingredients": "Farinha, Açúcar, Fermento",

"directions": "Misturar todos os ingredientes. Assar por 15 minutos.",

"notes": "Rende 3 porções.",

"tags": "Bolos, Doces"

}

```
 

## api/v1/recipes/update

**Method**: PUT

  

Update a recipe.

  

**Parameters**:

  

```

?id=4&name=Receita de Carneiro&ingredients=Carneiro, Sal, Pimenta

```

  

## api/v1/recipes/delete

**Method**: DELETE

  

Delete a recipe.

  

**Parameter**:


```

?id=3

```

  

## api/v1/recipes/getRecipeByName

**Method**: GET

  

Retrieve a recipe given name.

  

**Parameter**:

  

```

?name=Receita de Bolo

```


## api/v1/recipes/getRecipeByIngredientsList

**Method**: GET

  

Retrieve a recipe given ingredients list.

  

**Parameter**:

  

```

?ingredients=Sal,Pimenta

```

  

## api/v1/recipes/getRecipeByTag

**Method**: GET

  

Retrieve a recipe given a tag.

  

**Parameter**:

  

```

?tag=Doces

```