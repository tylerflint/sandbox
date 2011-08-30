class Speak < Base
  
  argument :name
  argument :enemy
  
  def tell_the_truth
    say "I am about to tell you the truth... check your Desktop", :red
    template('speak/the_truth.txt', "~/Desktop/the_whole_truth.txt")
  end
  
end