
require 'pry'
describe "Puppy Adoption Site" do
  describe "GET '/'" do
    before(:each) do
      get '/'
    end

    it "returns a 200 status code" do
      expect(last_response.status).to eq(200)
    end

    it "renders a welcome" do
      expect(last_response.body).to include("Welcome to the puppy adoption site!")
      expect(last_response.body).to include("Click Here To List A Puppy")
    end
  end

  describe "GET '/new'" do
    before(:each) do
      get '/new'
    end

    it "returns a 200 status code" do
      expect(last_response.status).to eq(200)
    end

    it "renders a new form element on the page" do
      expect(last_response.body).to include("<form")
      expect(last_response.body).to include("</form>")
    end

    it "renders the puppy input fields for name, breed, and age attributes on the page" do
      expect(last_response.body).to include("name")
      expect(last_response.body).to include("breed")
      expect(last_response.body).to include("age")
    end
  end

  describe "POST '/puppy'" do
    before do
      post '/puppy', {
          "name"=>"Ian",
          "breed"=>"Dalmation",
          "age"=>"6",
      }
    end

    it "returns a 200 status code" do
      expect(last_response.status).to eq(200)
    end

    it "displays the puppy information upon form submission" do
      expect(last_response.body).to include("Ian")
      expect(last_response.body).to include("Dalmation")
      expect(last_response.body).to include("6")
    end

  
  end
end