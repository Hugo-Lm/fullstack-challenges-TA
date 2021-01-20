RSpec::Support.require_rspec_core 'formatters/base_text_formatter'

class BonusFormatter < RSpec::Core::Formatters::DocumentationFormatter
  RSpec::Core::Formatters.register self, :dump_summary

  def dump_summary(notification)
    output.puts BONUS if notification.failure_count.zero?
    super notification
  end
end

BONUS = "

                _________________
               /                /|
              /                / |
             /________________/ /|
          ###|      ____      |//|
         #   |     /   /|     |/.|
        #  __|___ /   /.|     |  |_______________
       #  /      /   //||     |  /              /|                  ___
      #  /      /___// ||     | /              / |                 / \\ \\
      # /______/!   || ||_____|/              /  |                /   \\ \\
      #| . . .  !   || ||                    /  _________________/     \\ \\
      #|  . .   !   || //      ________     /  /\\________________  {   /  }
      /|   .    !   ||//~~~~~~/   0000/    /  / / ______________  {   /  /
     / |        !   |'/      /9  0000/    /  / / /             / {   /  /
    / #\\________!___|/      /9  0000/   /  / / /_____________/___  /  /
   / #     /_____\\/        /9  0000/   /  / / /_  /\\_____________\\/  /
  / #                      ``^^^^^^    /   \\ \\ . ./ / ____________   /
 +=#==================================/     \\ \\ ./ / /.  .  .  \\ /  /
 |#                                   |      \\ \\/ / /___________/  /
 #                                    |_______\\__/________________/
 |                                    |               |  |  / /
 |                                    |               |  | / /
 |                                    |       ________|  |/ /________
 |                                    |      /_______/    \\_________/\\
 |                                    |     /        /  /           \\ )
 |                                    |    /OO^^^^^^/  / /^^^^^^^^^OO\\)
 |                                    |            /  / /
 |                                    |           /  / /
 |                                    |          /___\\/
 |hectoras                            |           oo
 |____________________________________|

------------------------------------------------

"