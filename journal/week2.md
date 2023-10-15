# Terraform Beginner Bootcamp 2023 - Week 2

## Working with Ruby

### Bundler

Bundler is a package manager for runy.
It is the primary way to install ruby packages (known as gems) for ruby.

#### Install Gems

You need to create a Gemfile and define your gems in that file.

```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Then you need to run the `bundle install` command

This will install the gems on the system globally (unlike nodejs which install packages in place in a folder called node_modules)

A Gemfile.lock will be created to lock down the gem versions used in this project.

#### Executing ruby scripts in the context of bundler

We have to use `bundle exec` to tell future ruby scripts to use the gems we installed. This is the way we set context.

### Sinatra

Sinatra is a micro web-framework for ruby to build web-apps.

Its great for mock or development servers or for very simple projects.

You can create a web-server in a single file.

https://sinatrarb.com/

## Terratowns Mock Server

### Running the web server

We can run the web server by executing the following commands:

```rb
bundle install
bundle exec ruby server.rb
```

All of the code for our server is stored in the `server.rb` file.

## CRUD

Terraform Provider resources utilize CRUD.

CRUD stands for Create, Read Update, and Delete

https://en.wikipedia.org/wiki/Create,_read,_update_and_delete

## Nested Terraform Variables

To set nested Terraform variables in a `.tfvars` file, you can use a nested structure in HCL (HashiCorp Configuration Language). Here's how you can define and set nested variables in a `.tfvars` file:

Assuming you have a Terraform configuration with nested variables, such as:

```hcl
# variables.tf

variable "nested_var" {
  description = "A nested variable"
  type = object({
    attribute1 = string
    attribute2 = number
  })
}
```

You can set the values for the nested variable in a `.tfvars` file like this:

```hcl
# my_vars.tfvars

nested_var = {
  attribute1 = "value1"
  attribute2 = 42
}
```

## HTML issues
For my terratown, the images in my assets folder were not displaying. To fix this I altered the following lines for the **"aws_s3_object" "upload_assets"** resource:

  ```for_each = fileset("${var.public_path}/assets/", "*.{jpg,jpeg,png,gif}")```
  
  ```content_type = "image/*"```
