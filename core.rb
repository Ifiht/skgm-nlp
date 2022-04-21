# Require Ruby 3.1+
# Ruby Actors (Ractor): https://ruby-doc.org/core-3.1.0/Ractor.html?msclkid=29975868c00111ecb8671c348bae9e5c
# Ask Questions, until answer is not known
# Ruby Async (vice threads): https://brunosutic.com/blog/async-ruby?msclkid=14618aa1bffe11ecb527a183ad865646
require 'async'
require 'redis'
require 'bigdecimal'

class sk_Entry
    def initialize(v = nil, s = nil, c = 0.0)
        @value = v
        @source = s
        @confidence = c
    end
end

class sk_Timestamp < sk_Entry
end

class sk_Name < sk_Entry
end

class sk_Object
end

# Fix 0.1 binary operation errors:
(BigDecimal.new("1.2") - BigDecimal("1.0")) == BigDecimal("0.2")

number = 11
obj = Marshal.dump(number)
redis = Redis.new(host: "localhost", port: 6379, db: 11)
redis.set("mykey", obj)
redis.get("mykey")
# Maintain DB as knowledge "web"?
# What is the root? Give the web a single "truth" of confidence 100%?
# Path to nodes decided by membership, reorganize optimally (via membership)
# Routing to all nodes should be possible with a series of questions (group membership functions)
# How to decide when to stop branching??
# Abstract vs. Concrete(Discrete vs. Analog)

# func() Is Word?
# subfunc() What Language?

# func() Estimate Accuracy
# .. Significant Figures go here

#[[ Data Structure ]]
=begin

:Entry
-- Value
-- Source
-- Confidence Factor
    - notionally 99.7% for system, 95.0% for creator, 67.0% for all others (until adjusted)

:Object *get ability to lock object pieces, to avoid machine "evolving" into unsafe concepts
-- ID (IPv6 address?)
    - 340,282,366,920,938,463,463,374,607,431,768,211,456 addresses, compare to ~750,000 words in English
    - 6,909 languages spoken today,        ~5,181,750,000 words used by humans
    - requires dynamic addressing schema
-- Timestamp
-- Names
-- Object_Members
    - not an array, inclusion is formulaic
-X- Object_Membership
    - this is not required, all membership decided by formula in group object
-- Object_Relations
-- Actions?

=end
