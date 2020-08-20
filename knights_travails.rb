class Board

    attr_accessor :board
    def initialize
        @board = create_board
    end

    def create_board
        a = 0
        b = 0
        board = []

        while a <= 8
            while  b <=8
                board.push([a, b])
                b += 1
            end
            b = 0
            a += 1
        end
        board
    end

end


# Knight class
class Knight

    attr_accessor :start, :finish, :moves
    def initialize(start, finish)
        @start = start
        @finish = finish
        @moves = moves(start)
    end

    def filter_moves
    end

    def graph(arr, end1)
        graph = {}
        graph2 = []
        queue = []
        checked = []
        prev = {}
        queue.push(arr)
        i = 1
        p arr
        p visited


        while !queue.empty?
            if !checked.include?(queue.last)
                checked.push(queue.last)
                 poss_moves = moves(queue.last)
                 poss_moves.each do |vertex|
                    if !prev[vertex]
                        prev[vertex] = queue.last
                    end
                 end
                graph[queue.last] = poss_moves
                graph2.push(poss_moves)
                if poss_moves.include?(end1)
                    prev[arr] = nil
                    return backtrack(end1, prev)
                end
                 graph[queue.last]
                poss_moves.each do |move|
                    queue.unshift(move)
                end
                queue.pop
                i += 1
            else
                queue.pop
            end
        end
        prev
    end

    def backtrack(vertex, prev_array)
        p prev_array
        path = []
        current_vertex = vertex

        while current_vertex != nil
            path << current_vertex
            current_vertex = prev_array[current_vertex]
        end
        path.reverse
    end


    def bfs(arr, end1)
    end
        

    def moves(arr)
        #arr = start
        result = []
        moves = [[2, 1],
                [1, 2], 
                [-1, 2], 
                [-2, 1],
                [-2, -1], 
                [-1, -2],
                [1, -2],
                [2, -1]]
        possible_moves = moves.map do |num1, num2|
            [arr[0] + num1, arr[1] + num2]
        end
        possible_moves.reject do |num1, num2|
            num1 < 0 || num1 > 8 || num2 < 0 || num2 > 8
        end
    end
end

test = Knight.new([1,1], [3,3])
#p test.moves
p test.graph([0,0], [6,3])


        