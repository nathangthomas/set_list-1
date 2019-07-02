require 'rails_helper'

RSpec.describe Cart do
  describe "instance methods" do
    describe "#contents" do
      it "should return an empty hash when contents are nil" do
        cart = Cart.new(nil)
        expect(cart.contents).to eq({})
      end

      it "should return a hash when contents exist" do
        cart = Cart.new({"423" => 3, "21" => 7})
        expect(cart.contents).to eq({"423" => 3, "21" => 7})
      end
    end

    describe "#add_song" do
      it "adds songs" do
        cart = Cart.new(nil)

        cart.add_song(2)
        cart.add_song(7)
        cart.add_song(2)
        cart.add_song(6)
        cart.add_song(2)
        cart.add_song(7)

        expected = {
          "2" => 3,
          "6" => 1,
          "7" => 2
        }

        expect(cart.contents).to eq(expected)
      end
    end

    describe "#total" do
      it "returns the total quantities" do
        cart = Cart.new({"2" => 3,"6" => 1,"7" => 2})
        expect(cart.total).to eq(6)
      end
    end

    describe "#song_count" do
      it "returns the quantity of a song" do
        cart = Cart.new({"2" => 3,"6" => 1,"7" => 2})
        expect(cart.song_count(2)).to eq(3)
      end
    end
  end
end
