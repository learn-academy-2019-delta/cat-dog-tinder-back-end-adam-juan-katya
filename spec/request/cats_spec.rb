require 'rails_helper'

RSpec.describe "Cats API", type: :request do
    it "gets a list of Cats" do
        Cat.create(name: 'Felix', age:2, enjoys:'Walks in the park')

        get '/cats'
        json = JSON.parse(response.body)
        expect(response).to have_http_status(:ok)
        expect(json.length).to eq 1
    end

      it "creates a cat" do
      cat_params = {
        cat: {
          name: 'Buster',
            age: 4,
            enjoys: 'Meow Mix, and plenty of sunshine.'
        }
      }

          post '/cats', params: cat_params

          expect(response).to have_http_status(:ok)

          new_cat = Cat.first
          expect(new_cat.name).to eq('Buster')

          json = JSON.parse(response.body)
end

      it "doesn't create a cat without a name" do
            cat_params = {
                cat: {
                  age: 4,
                  enjoys: 'Meow Mix, and plenty of sunshine.'
            }
        }
         post '/cats', params: cat_params
         json = JSON.parse(response.body)
           expect(json['name']).to include "can't be blank"

    end
end
