
kelompokLine =[]
asistenLine = []
jmlAsisten=0;


File.open("kelompok.txt", "r").each_line do |line|
  # name: "Angela"    job: "Writer"    ...
  data = line.split(/\n/)
  kelompokLine.push(data[0].split(";",4))
end
File.open("asisten.txt", "r").each_line do |line|
  # name: "Angela"    job: "Writer"    ...
  data = line.split(/\n/)
  asistenLine.push(data[0].split(";",4))
end

asistenAll = []
asisten = []
asistenLine.each do |line|
  start= line[1].to_i
  finish=line[2].to_i
  while start <=finish do
	#puts line[0] + start.to_s
	asisten.push("asisten " + line[0] + start.to_s)
	jmlAsisten+=1;
	asistenAll.push(asisten.clone())
	asisten.clear()
	start+=1
  end
end

kelompok = []
kelompokLine.each do |line|
  start= line[1].to_i
  finish=line[2].to_i
  while start <=finish do
	kelompok.push(line[0].clone() + start.to_s)
	asistenAll.each do |j|
		if j[0].include? line[0]
			#puts j[0]
			
		end
	end
	#puts asistenAll[1][0]
	
	start+=1
  end
end

def himpunan(asistenAll)
	c=0
	asistenAll.each do |line|
		c+=line.count
	end
	return c
end


limit=kelompok.count+(jmlAsisten)
i=0
val=0
abs=0
flag_kls=0
while himpunan(asistenAll) <(limit) do

	val=rand(0...kelompok.count-1)
	if val==NIL
		val=0
	end
	#puts asistenAll[i][0].to_s + " " +kelompok[val][0].to_s
	#puts asistenAll[i][0].to_s.include? kelompok[val][0].to_s
	#puts himpunan(asistenAll)-20,kelompok.count
	#puts "abs=" +abs.to_s,"i=" + i.to_s,"hmp="+himpunan(asistenAll).to_s,"limit=" +limit.to_s,"kelompok=" +kelompok.count.to_s,val
	
	if !(asistenAll[i][0].to_s.include? kelompok[val][0].to_s)
		asistenAll[i].push(kelompok[val].clone())
		puts "normal " +asistenAll[i][0].to_s + "=>" +kelompok[val].to_s
		kelompok.delete(kelompok[val])
		abs+=1
	elsif
		asistenAll.each do |line|
			if !(line[0].to_s.include? kelompok[val][0].to_s)
				ran=rand(1...line.count-1)
				if ran==NIL
					next
				elsif
					# puts "ganjil " +asistenAll[i][0].to_s + "=>" +kelompok[val].to_s
		
					line.push(kelompok[val].clone())
					kelompok.push(line[ran].clone())
					kelompok.delete(kelompok[val])
					
					line.delete(line[ran])
					
					abs+=1
					break					
				end
			end
		end
	end
	if asistenAll[i].count >4 and flag_kls==0
		if i== asistenAll.count-1
			flag_kls=1
		
		elsif i+=1
		end
	
	elsif asistenAll[i].count >4 and flag_kls==1
		if i==0
			flag_kls=0
		
		elsif i-=1
		end
	end

end

asistenAll.each do |line|
	ran =rand(0...line.count-1)

	if ran==nil
		next
	end
	#puts line[0].to_s + " " +line.count.to_s + " " + ran.to_s
	
end

puts himpunan(asistenAll)
open('output.txt', 'a') { |f|
  asistenAll.each do |line|
	f.puts(line.count-1)
	line.each do |kel|
		f.puts(kel)
	end
  end
}

gets