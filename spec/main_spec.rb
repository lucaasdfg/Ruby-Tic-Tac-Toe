# frozen_string_literal: true

require_relative '../bin/main.rb'

 describe "#display_invalid_choice" do
   it "should display text when called" do
     test = "\n\nINVALID CHOICE\n\n You can choose only EMPTY cells using letters & numbers: a1, a2, b3, c4, etc.\n\n"
    expect(display_invalid_choice).to eql(test)
    end
 end
