module Maybe
  VERSION = "0.1.0"

  abstract class Maybe(T)
    include Enumerable(T)

    abstract def map(&block : T -> U): Maybe(U) forall U

    abstract def or_else(x : T)

    def just?
      return typeof(self) == Just(T)
    end

    def nothing?
      return !just?
    end

    def inspect
      to_s
    end

    def inspect(io)
      io << to_s
    end
  end

  class Just(T) < Maybe(T)
    def initialize(@value : T); end

    def value
      @value
    end

    def map(&block : T -> U) forall U
      Just.new(block.call(@value))
    end

    def to_s
      "#{typeof(self)}(#{@value})"
    end

    def or_else(x : T)
      self
    end

    def each(&block)
      yield @value
    end
  end

  class Nothing(T) < Maybe(T)
    def map(&block : T -> U): Nothing(U) forall U
      Nothing(U).new
    end

    def to_s
      typeof(self).to_s
    end

    def or_else(x : T): Just(T)
      Just.new(x)
    end

    def each(&block)
    end
  end
end
