cw=640
ch=480
posx=270
posy=400
start=false
start2=false
function love.load()
    love.graphics.setBackgroundColor(0,0,0)
    player={}
    computer={}
    player.name="You"
    computer.name="Computer"
    love.graphics.setNewFont("fonts/Orbitron Medium.otf",14)
    back=love.graphics.newImage("images/back.jpg")
    back2=love.graphics.newImage("images/back2.jpg")
    text=love.graphics.newImage("images/text.png")
end
function love.draw()
    love.graphics.setColor(0.8,0.8,0.8) 
    if start==false then   
        love.graphics.draw(back,0,100,0,0.25,0.25,0,0,0,0);   
        love.graphics.draw(back2,0,50,0,0.25,0.25) 
        love.graphics.draw(back2,0,0,0,0.25,0.25)         
        love.graphics.setColor(0.2,0.2,0.2)
        love.graphics.setColor(1,1,1)
        love.graphics.rectangle("line",40,180,280,162)
        love.graphics.line(40, 215, 320, 215)    
        love.graphics.draw(text,20,30,0,0.6,0.6)      
        love.graphics.setNewFont("fonts/Orbitron Medium.otf",14)    
        love.graphics.print("Click to start the game ",230,ch-70); 
        love.graphics.print("Game Objectives:",42,188);
        love.graphics.setNewFont("fonts/arial.ttf",15)
        love.graphics.printf("The game is pretty simple, you just have to press the 'enter' key to continue and then dices will be rolled. The Player with the largest number appearing on his dice will be declared the winner and the game",42,230,278,'justify')   
        love.graphics.print("would be a draw if no one wins",42,315)
        love.graphics.setColor(0.7,0.7,0.7)    
        love.graphics.print("(C) Copyright Okra Softmakers",12,455)
    else
        love.graphics.setNewFont("fonts/LeagueGothic-Regular.otf",30) 
        for i=0,ch,50 do
            love.graphics.draw(back2,0,i,0,0.25,0.25) 
        end
        drawSetup(computer,player,start2)
        if start2==true then
            love.graphics.setColor(1, 0, 0,0.6)
            if player.chances > computer.chances then
                love.graphics.print(player.name.." Won!!",posx+10,posy)
            elseif computer.chances > player.chances then
                love.graphics.print(computer.name.." Won!!",posx-10,posy)
            else
                love.graphics.print("Game Draw!!",posx,posy)
            end
        else
            love.graphics.print("Click To Continue",cw/2-75,ch/2-10)
        end
    end 
end
function drawSetup(lside,rside,cond)
    love.graphics.print(lside.name,130-2*string.len(lside.name),20);
    love.graphics.line(80, 20, 220, 20)
    love.graphics.line(80, 60, 220, 60)
    love.graphics.print(rside.name,440+2*string.len(lside.name),20);
    love.graphics.line(410, 61, 550, 61)
    love.graphics.line(410, 21, 550, 21)
    if cond==true then
        love.graphics.draw(lside.pic,90,230,0,0.4,0.4);
        love.graphics.draw(rside.pic,410,230,0,0.4,0.4)
    end
end
function love.mousereleased(leftbtn)
    if start==true then
        start2=true
    end
    start=true
    math.randomseed(os.time())
    player.chances = math.random(1,6) 
    computer.chances = math.random(1,6) 
    player.pic=love.graphics.newImage("images/dice/"..player.chances.."black.svg.png");   
    computer.pic=love.graphics.newImage("images/dice/"..computer.chances.."red.svg.png");   
end