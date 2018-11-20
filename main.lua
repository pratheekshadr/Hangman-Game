words = {'leopard','cat','dog','monkey','fish','goat','horse','ant','lion','tiger','cow'}
math.randomseed(os.time())
rand_no = math.random(table.getn(words))
random_word = words[rand_no]

print(random_word)
st_len = string.len(random_word)
k = random_word

us = {}	
for i=1,st_len do
	table.insert(us, '_')
end

dir = 3
pos = 250
manpos = 8000
manh = 3350

gameend=0
count=0

c = 0
cou = 0
wrongval = {""}
l = {}
lost = 0
function love.load()
    love.window.setMode(1000, 700)
   	love.graphics.setColor(255, 255, 255)
    love.graphics.setFont(love.graphics.newFont("fonts/font.ttf",60))

    img1 = love.graphics.newImage("images/sand.png")
    img2 = love.graphics.newImage("images/genie.png")
    img3 = love.graphics.newImage("images/blocks.png")
    img4 = love.graphics.newImage("images/rope.png")
    img5 = love.graphics.newImage("images/man.png")
    img8 = love.graphics.newImage("images/gameover.png")
    img9 = love.graphics.newImage("images/7.jpg")

    oh_no = love.audio.newSource("audio/ohno.wav","static")
	yay   = love.audio.newSource("audio/yay.wav", "static")

    sand = love.graphics.newQuad(100, 160, 140, 100, img1:getDimensions())
    blocks = love.graphics.newQuad(20, 0, 50, 50, img3:getDimensions())
    rope = love.graphics.newQuad(100, 500, 500, 800, img4:getDimensions())
    text = ""
end

function love.draw()
	--for vertical
	love.graphics.draw(img2, pos, 0)
	for i=100,500,40 do
		love.graphics.draw(img3, blocks, 50,i)
	end

	for i=90,230,40 do
		love.graphics.draw(img3, blocks, i,100)
	end

	for i=0,1000,140 do
		for j=500,700,100 do
			love.graphics.draw(img1, sand, i, j)
		end
	end

	love.graphics.push()
	love.graphics.scale(0.2, 0.2)
	love.graphics.draw(img4, rope, 700 ,750)
	love.graphics.pop() 

	love.graphics.push()
	love.graphics.scale(0.1, 0.09)
	love.graphics.draw(img5, manpos, manh)
	love.graphics.pop()
		
    if((count==1) and (gameend==0))  then
    	manpos = 7000

	elseif((count==2) and (gameend==0) )then
		manpos = 6000

	elseif((count==3) and (gameend==0))then
		manpos = 5000

	elseif((count==4) and (gameend==0))then
		manpos = 4000
			
	elseif((count==5) and (gameend==0))then
		manpos = 3000
			
	elseif((count==6) and (gameend==0))then
		manpos = 2000
			
	elseif((count>6) and (gameend==0))then
			lost = 1
			text  = ""
			wrongval = {""}
			us = {""}
			manh = 2200
			manpos = 1100
			love.graphics.print("GAME OVER", 400, 300)

	elseif(gameend == 1)then
			love.graphics.clear()
			wrongval = {""}
			us = {""}
			love.graphics.draw(img9, 300, 200)
			love.graphics.setBackgroundColor(0,0,0,0)
			love.graphics.print("Congratulations!!!",200,50)
	end

	if(table.maxn(wrongval)>0) then
		wrong_values = table.concat(wrongval," ")
		love.graphics.print( wrong_values, 0, 0 )
	end

	characterString = table.concat(us," ")		--stores answer as we type.
	love.graphics.print( characterString, 260, 450 )
	
	love.graphics.print( text, 300, 300 )
	text=text:gsub("%s+", "")
	text=string.gsub(text,"%s+", "")

	characterString = table.concat(us," ")		--stores answer as we type.
	love.graphics.print( characterString, 260, 450 )
end

function love.update(dt)
	if(pos > 700) then
		dir = -3
	elseif(pos<250) then
		dir = 3
	end
	pos = pos + dir 
end


function love.keypressed( key )
	local i = 0
	
	flag = 0
	if key=="escape" then
	        love.event.quit()

	elseif(lost == 0) then 
		if key == "backspace" then
			text = text.sub(text,1, -2)
			
		elseif key=="return" then
			characterString = string.gsub(characterString,"%s+", "")
			
			for letter in k:gmatch ("%a") do		
				table.insert(l,i,letter)	--table l will have all characters of random_elem i.e.,k 
				i = i+1
				c = string.find(k,text)		--finding position of the entered character in random element								
				if(letter==text) then 
					flag = 1
					us[c]=text			--replacing underscore at that position if entered characteris one among the correct characters.
				end	
			end
			
			if(flag==0) then				--if entered character is wrong character then insert to table wrongval to displayed characters already typed before. 
				cou = cou+1
				table.insert(wrongval,cou,text)
			end

			if characterString == random_word then
				gameend = 1
				yay:play()
				flag = 0	
			elseif(flag==0) then
				text='Tryagain'
				oh_no:play()
				count= count+1
			end

		else
			if(text=='Tryagain') then
				text = ""
			end
			flag = 0
			text = key	
		end
	end
end 