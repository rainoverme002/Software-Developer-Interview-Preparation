# @param {Integer[][]} grid
# @return {Integer}
def max_increase_keeping_skyline(grid)

  @highesttopbottom = Array.new(grid.length,0)
  @highestleftright = Array.new(grid.length,0)

  #sum variable fro answer the sum of the difference change between the grid and new grid
  $sum = 0

  @newgrid = Array.new

  #Looping Two Times for the Reading the Skylines
  for i in 0...grid.length
    for j in 0...grid.length
      if i == 0 && j == 0
        @highestleftright[i] =  grid[i][j]
        @highesttopbottom[j] =  grid[i][j]
      elsif grid[i][j] > @highestleftright[i]
        @highestleftright[i] =  grid[i][j]
      end
      if grid[i][j] > @highesttopbottom[j]
        @highesttopbottom[j] =  grid[i][j]
      end
    end
  end

  # The Skylines
  #puts @highestleftright
  #puts @highesttopbottom

  #Looping Two Times for the New Grid 
  for i in 0...grid.length
    for j in 0...grid.length
      if grid[i][j] < @highestleftright[i] && grid[i][j] < @highesttopbottom[j]
        exgrid = grid[i][j]
        if @highestleftright[i] > @highesttopbottom [j]
          $sum+=(@highesttopbottom[j] - grid[i][j])

          grid[i][j] = @highesttopbottom[j]
          #puts @highestleftright[i]

        else
          $sum+=(@highestleftright[i] - grid[i][j])

          grid[i][j] = @highestleftright[i]
          #puts @highestleftright[j]
        end
      end
    end
  end

  return $sum
end

grid = [[3,0,8,4],[2,4,5,7],[9,2,6,3],[0,3,1,0]];

answer = max_increase_keeping_skyline(grid);

puts answer;
