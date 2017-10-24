def input_peep(text = "peep content is this")
  visit '/'
  # save_and_open_page
  fill_in('peep_text', with: text)
  # save_and_open_page
  fill_in('username', with: "will") # this line will probably need to be removed later
  # save_and_open_page
  click_button("Peep peep!!")
  # save_and_open_page
end
