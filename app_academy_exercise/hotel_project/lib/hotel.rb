require_relative "./room"

class Hotel
    require "byebug"

    def initialize (name, hash)      
        @name = name
        @rooms = {}
        hash.each { |k, v| @rooms[k] = Room.new(v)}
        # hash.keys.each do |k| 
        #     hash.values.each do |v|
        #         @rooms[k] = Room.initialize(v)
        #     end
        # end
    end

    def name 
        capitalized = @name.split(" ").each(&:capitalize!)
        capitalized.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if !self.room_exists?(room_name)
            puts "sorry, room does not exist"
        else 
            if @rooms[room_name].add_occupant(person)
                @rooms[room_name].occupants
                print 'check in successful'
            else 
                print 'sorry, room is full'
            end
        end
    end

    def has_vacancy?
        if @rooms.each.all? { |k,v| @rooms[k].full? }
            return false
        else
            return true
        end

        # if @rooms.values.all? { |room| room.available_space == 0 }
        #     return false
        # else 
        #     return true
        # end
    end

    def list_rooms
        
        @rooms.each { |k, v| puts "#{k} * #{v.available_space}"}
        
        # sorted.each { |k, v| puts "#{sorted[k]} * #{sorted[v]}" }

    end
end
