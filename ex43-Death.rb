class Death

   def initialize()
   end

   def main()
      @sentences = [
         "You think you could defeat CPS. You were not lucky enough.",
         "Memento mori!",
         "Cthulu studied here and he went unnoticed. You are not mad enough."
      ]
      puts @sentences[rand(@sentences.length())]
      Process.exit(1)
      # Another way is to return nil and check for that in Engine
   end
end
