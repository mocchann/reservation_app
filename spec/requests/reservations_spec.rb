require 'rails_helper'

RSpec.describe "/reservations", type: :request do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }
  
  let(:invalid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }
  
  describe "GET /index" do
  it "renders a successful response" do
    Reservation.create! valid_attributes
    get reservations_url
    expect(response).to be_successful
  end
end
 
describe "GET /show" do
  it "renders a successful response" do
    reservation = Reservation.create! valid_attributes
    get reservation_url(reservation)
    expect(response).to be_successful
  end
end
 
describe "POST /new" do
  it "renders a successful response" do
    reservations = Reservation.new valid_attributes # 謎
    post reservations_new_url(reservations)
    expect(response).to be_successful
  end
end
 
describe "GET /edit" do
  it "render a successful response" do
    reservation = Reservation.create! valid_attributes
    get edit_reservation_url(reservation)
    expect(response).to be_successful
  end
end
 
describe "POST /create" do
  context "with valid parameters" do
    it "creates a new Reservation" do
      expect {
        post reservations_url, params: { reservation: valid_attributes }
      }.to change(Reservation, :count).by(1)
    end
     
    it "redirects to the created reservation" do
      post reservations_url, params: { reservation: valid_attributes }
      expect(response).to redirect_to(reservation_url(Reservation.last))
    end
  end
   
  context "with invalid parameters" do
    it "does not create a new Reservation" do
      expect {
        post reservations_url, params: { reservation: invalid_attributes }
      }.to change(Reservation, :count).by(0)
    end
     
    it "renders a successful response (i.e. to display the 'new' template)" do
      post reservations_url, params: { reservation: invalid_attributes }
      expect(response).to be_successful
    end
  end
end
 
describe "PATCH /update" do
  context "with valid parameters" do
    let(:new_attributes) {
      skip("Add a hash of attributes valid for your model")
    }
     
    it "updates the requested reservation" do
      reservation = Reservation.create! valid_attributes
      patch reservation_url(reservation), params: { reservation: new_attributes }
      reservation.reload
      skip("Add assertions for updated state")
    end
     
    it "redirects to the reservation" do
      reservation = Reservation.creste! valid_attributes
      patch reservation_url(reservation), params: { reservation: new_attributes }
      reservation.reload
      expect(response).to redirect_to(reservation_url(reservation))
    end
  end
   
  context "with invalid parameters" do
    it "renders a successful respose (i.e. to display the 'edit' template)" do
      reservation = Reservation.create! valid_attributes
      patch reservation_url(reservation), params: { reservation: invalid_attributes }
      expect(response).to be_successful
    end
  end
end
 
end
