require 'pry'

def generator
  Array.new(100) { Array.new(50) { 0 } }
end

def evaluate_gene(generation)
  generation.map do |gene| 
    fitness(gene)
  end
end

def fitness(gene)
  if gene.all? { |x| x == 1}
    return gene
  else
    good = gene_count(gene)
    new_gene = mutate(good) + good
    fitness(new_gene)
  end
end

def gene_count(gene)
  if count(gene[0..24]) > count(gene[25..-1])
    gene[0..24]
  else
    gene[25..-1]
  end
end

def count(gene)
  gene.inject { |x,y| x + y }
end

def mutate(gene)
  gene.map { |g| rand(100) == 1 ? flip_gene(g) : g }
end

def flip_gene(g)
  g == 1 ? 0 : 1
end

evaluate_gene(generator)