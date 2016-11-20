require 'evoasm/test'
require 'evoasm/population'
require 'evoasm/prng'
require 'population_helper'

Evoasm.min_log_level = :info
require 'pp'
module Search
  class GCDTest < Minitest::Test
    include PopulationHelper
    include PopulationHelper::Tests

    SEED = Array.new(Evoasm::PRNG::SEED_SIZE){ rand(10000) }

    def setup
      set_default_parameters

      @instruction_names = Evoasm::X64.instruction_names(:gp, :rflags)
      #p @instruction_names.size
      #@instruction_names = @instruction_names.reject {|i| i =~ /(r|rm)(16|8)/}
      #p @instruction_names.size
      #p Evoasm::X64.instruction_names(:gp, :rflags)[0..85] - Evoasm::X64.instruction_names(:gp, :rflags)[0..80]

      @examples = {
        [5, 1] => 1,
        [15, 5] => 5,
        [8, 2] => 2,
        [8, 4] => 4,
        [8, 6] => 2,
        [16, 8] => 8
      }
      p SEED

      @seed = SEED
      @kernel_size = 20
      @program_size = 5
      #@deme_size = 5000
      #@mutation_rate = 0.2
      @parameters = %i(reg0 reg1 reg2 reg3)
      start
    end

    def test_consistent_progress
      super
    end

    def test_program_run
      # should generalize (i.e. give correct answer for non-training data)
      #assert_equal 2, found_program.run(16, 6)
      #assert_equal 1, found_program.run(15, 2)
    end
  end
end
