def input_peep(text="peep content is this")
  visit '/'
  fill_in('peep_input', with: text)
  fill_in('username', with: "will") #this line will probably need to be removed later
  click_button("Peep peep!!")
end
