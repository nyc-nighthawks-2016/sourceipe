class Category < ActiveRecord::Base
  has_many :recipes


  def merge_sort(list)
    if list.length <= 1
      list
    else
      mid = (list.length / 2).floor
      left = merge_sort(list[0..mid - 1])
      right = merge_sort(list[mid..list.length])
      merge(left, right)
    end
  end

  def merge(left, right)
    if left.empty?
      right
    elsif right.empty?
      left
    elsif left.first.weighted_ratings < right.first.weighted_ratings
      [left.first] + merge(left[1..left.length], right)
    else
      [right.first] + merge(left, right[1..right.length])
    end
  end

  def top_recipes
    merge_sort(self.recipes).last(5)
  end

  def vote_count
    self.recipes.reduce(0) {|sum, recipe| sum + recipe.ratings.length}
  end
  
  def vote_mean
    vote_count/2
  end

end
