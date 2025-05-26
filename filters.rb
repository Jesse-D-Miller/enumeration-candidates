# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  for candidate in candidates
    return candidate if candidate[:id] == id
  end
  nil
end
  
def experienced?(candidate)
  if candidate[:years_of_experience] > 2
    true
  else
    false
  end
end

def qualified_candidates(candidates)
  arr_of_qualified_candidates = []

  for candidate in candidates
    if experienced?(candidate) && 
      candidate[:github_points] >= 100 && 
      candidate[:age] > 17 && 
      candidate[:date_applied] >= 15.days.ago.to_date && 
      (candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python'))

      # push candidates into an array
      arr_of_qualified_candidates << candidate
    end
  end

  arr_of_qualified_candidates
end

def ordered_by_qualifications(candidates)
  sorted_by_experience = candidates.sort_by { |candidate| [candidate[:years_of_experience], candidate[:github_points]]}
  reversed_sorted_by_experience = sorted_by_experience.reverse
end