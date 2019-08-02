# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

# Recipes API

## Endpoints

###  api/v1/recipes/create
**Method**: POST
**Data**: 

```
{
	"name": "Receita de Bolo",
	"ingredients": "Farinha, Açúcar, Fermento",
	"directions": "Misturar todos os ingredientes. Assar por 15 minutos.",
	"notes": "Rende 3 porções.",
	"tags": "Bolos, Doces"
}
```

### api/v1/recipes/update
**Method**: PUT
**Parameters**: 

```
?id=4&name=Receita de Carneiro&ingredients=Carneiro, Sal, Pimenta
```

### api/v1/recipes/delete
**Method**: DELETE
**Parameter**: 

```
?id=3
```

### api/v1/recipes/getRecipeByName
**Method**: PUT
**Parameter**: 

```
?name=Receita de Bolo
```

### api/v1/recipes/getRecipeByIngredientsList
**Method**: PUT
**Parameter**: 

```
?ingredients=Sal,Pimenta
```

### api/v1/recipes/getRecipeByTag
**Method**: PUT
**Parameter**: 

```
?tag=Doces
```

