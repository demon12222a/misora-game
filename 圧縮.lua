local _={}
do
	local q={}
	q[1]=game:GetService("ReplicatedStorage")
	q[2]=game:GetService("Players")
	q[3]=game:GetService("TweenService")
	q[4]=game:GetService("RunService")
	q[5]=game:GetService("UserInputService")
	q[6]=q[2].LocalPlayer
	q[7]=q[1]:WaitForChild("Misora")
	q[8]=q[7]:WaitForChild("FieldAct")
	q[9]=q[7]:WaitForChild("FieldEvent")
	q[10]=require(q[7]:WaitForChild("Sim"))

	-- 文字列生成を隠す（_s を即時実行で包み、外部から見えなくする）
	local S=(function()
		local f=string.char
		local t={}
		local raw={
			[1]={83,99,114,101,101,110,71,117,105},
			[2]={70,114,97,109,101},
			[3]={84,101,120,116,76,97,98,101,108},
			[4]={84,101,120,116,66,117,116,116,111,110},
			[5]={85,73,71,114,97,100,105,101,110,116},
			[6]={85,73,67,111,114,110,101,114},
			[7]={85,73,83,116,114,111,107,101},
			[8]={83,99,114,111,108,108,105,110,103,70,114,97,109,101},
			[9]={85,73,80,97,100,100,105,110,103},
			[10]={85,73,76,105,115,116,76,97,121,111,117,116},
			[11]={72,117,109,97,110,111,105,100},
			[12]={72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116},
			[13]={72,101,97,100},
			[14]={72,80},
			[15]={66,105,108,108,98,111,97,114,100,71,117,105},
			[16]={83,116,114,105,110,103,86,97,108,117,101},
			[17]={70,105,101,108,100,83,116,117,102,102},
			[18]={69,110,101,109,105,101,115},
			[19]={77,105,115,111,114,97,73,110,71,97,109,101},
			[20]={99,111,105,110,115},
			[21]={99,111,105,110,115,65,108,108},
			[22]={115,119,105,110,103},
			[23]={107,105,110,100},
			[24]={108,105,115,116},
			[25]={97,100,100},
			[26]={100,101,108},
			[27]={80,108,97,121,101,114,71,117,105},
			[28]={87,97,108,107,83,112,101,101,100},
			[29]={80,111,115,105,116,105,111,110},
			[30]={78,97,109,101},
			[31]={86,97,108,117,101},
			[32]={84,101,120,116},
			[33]={95,95,110,101,119,105,110,100,101,120},
			[34]={97,117,116,111,32,102,97,114,109,32,103,117,105},
			[35]={80,97,110,101,108},
			[36]={65,117,116,111,32,67,111,105,110},
			[37]={65,117,116,111,32,84,101,108,101,112,111,114,116},
			[38]={69,110,101,109,121,32,84,80,32,43,32,83,119,105,110,103},
			[39]={87,97,108,107,83,112,101,101,100,58,32},
			[40]={83,112,101,101,100},
			[41]={82,111,119,95},
			[42]={227,129,138,227,129,147,227,129,163,227,129,166,227,129,139,227,130,181,227,131,149,227,131,188,227,131,171},
			[43]={227,129,138,227,129,147,227,129,163,227,129,166,227,130,181,227,131,149,227,131,188,227,131,171},
			[44]={227,129,138,227,129,147,227,129,163,227,129,166,227,129,161,227,129,179,227,130,181,227,131,149,227,131,188,227,131,171},
			[45]={227,129,167,227,129,139,227,130,181,227,131,149,227,131,188,227,131,171},
			[46]={227,130,181,227,131,149,227,131,188,227,131,171},
			[47]={227,129,161,227,129,179,227,130,181,227,131,149,227,131,188,227,131,171},
			[48]={227,129,191,227,129,157,227,131,129,227,131,188,240,159,164,147},
			[49]={227,130,181,227,131,188,227,131,144,227,131,188,227,130,173,227,131,163,227,131,169,232,161,168},
		}
		for i,v in ipairs(raw)do t[i]=f(table.unpack(v))end
		return t
	end)()

	-- 間接参照（キーも数値化）
	local x={}
	x[1]=Instance.new
	x[2]=CFrame.new
	x[3]=Vector3.new
	x[4]=Color3.fromRGB
	x[5]=Vector2.new
	x[6]=UDim2.new
	x[7]=UDim2.fromOffset
	x[8]=UDim2.fromScale
	x[9]=UDim.new
	x[10]=TweenInfo.new
	x[11]=ColorSequence.new
	x[12]=Enum.Font.GothamBlack
	x[13]=Enum.Font.GothamBold
	x[14]=Enum.TextXAlignment.Left
	x[15]=Enum.TextTruncate.AtEnd
	x[16]=Enum.SortOrder.LayoutOrder
	x[17]=Enum.UserInputType.MouseButton1
	x[18]=Enum.UserInputType.Touch
	x[19]=Enum.UserInputType.MouseMovement

	-- UI名の短縮エイリアス（数値キーのみ）
	local i1=S[1]local i2=S[2]local i3=S[3]local i4=S[4]local i5=S[5]local i6=S[6]local i7=S[7]local i8=S[8]local i9=S[9]local i10=S[10]
	local i11=S[11]local i12=S[12]local i13=S[13]local i14=S[14]local i15=S[15]local i16=S[16]local i17=S[17]local i18=S[18]
	local i19=S[19]local i20=S[20]local i21=S[21]local i22=S[22]local i23=S[23]local i24=S[24]local i25=S[25]local i26=S[26]
	local i27=S[27]local i28=S[28]local i29=S[29]local i30=S[30]local i31=S[31]local i32=S[32]local i33=S[33]local i34=S[34]
	local i35=S[35]local i36=S[36]local i37=S[37]local i38=S[38]local i39=S[39]local i40=S[40]local i41=S[41]local i42=S[42]
	local i43=S[43]local i44=S[44]local i45=S[45]local i46=S[46]local i47=S[47]local i48=S[48]local i49=S[49]

	local _0=q[6]:WaitForChild(i27):FindFirstChild(i34)
	if _0 then _0:Destroy()end

	-- 状態を数値キー配列に（s.f など見えなくする）
	local s={}
	s[1]={}  -- coinIds
	s[2]={}  -- coinSeen
	s[3]=false -- autoCoin
	s[4]=false -- autoTeleport
	s[5]=false -- enemyLoop
	s[6]=0    -- lastSwing
	s[7]=nil  -- enemyTarget
	s[8]=false -- speedEnabled
	s[9]=125  -- targetSpeed
	s[10]={i42,i43,i44,i45,i46,i47} -- priority list
	s[11]={}  -- priority map
	for i,v in ipairs(s[10])do s[11][v]=i end

	local _1
	_1=hookmetamethod(game,i33,newcclosure(function(a,b,c)if b==i28 then if checkcaller()then return _1(a,b,c)end return end return _1(a,b,c)end))

	task.spawn(function()while true do q[4].Heartbeat:Wait()if s[8]then local ch=q[6].Character local hu=ch and ch:FindFirstChildOfClass(i11)if hu and hu[i28]~=s[9]then hu[i28]=s[9] end end end end)

	local u={}
	u[1]=x[1](i1)u[1].Name=i34 u[1].ResetOnSpawn=false u[1].IgnoreGuiInset=true u[1].DisplayOrder=100 u[1].Parent=q[6]:WaitForChild(i27)
	u[2]=x[1](i2)u[2].Name=i35 u[2].AnchorPoint=x[5](0,0)u[2].Position=x[7](20,120)u[2].Size=x[7](220,580)u[2].BackgroundColor3=x[4](25,25,32)u[2].BackgroundTransparency=0.05 u[2].BorderSizePixel=0 u[2].Active=true u[2].Draggable=true u[2].Parent=u[1]

	local g1=x[1](i5)g1.Color=x[11](x[4](35,35,45),x[4](15,15,20))g1.Rotation=90 g1.Parent=u[2]
	local g2=x[1](i6)g2.CornerRadius=x[9](0,10)g2.Parent=u[2]
	local g3=x[1](i7)g3.Color=x[4](70,70,90)g3.Thickness=1.5 g3.Transparency=0.5 g3.Parent=u[2]
	local g4=x[1](i3)g4.Size=x[6](1,0,0,36)g4.BackgroundTransparency=1 g4.Text=i48 g4.Font=x[12]g4.TextSize=16 g4.TextColor3=x[4](255,255,255)g4.Parent=u[2]
	local g5=x[1](i5)g5.Color=x[11](x[4](160,220,255),x[4](200,160,255))g5.Parent=g4

	local function F(a,b,c,d)
		local e={}
		e[1]=x[1](i4)e[1].Size=x[6](1,-20,0,36)e[1].Position=x[7](10,d)e[1].BackgroundColor3=x[4](40,40,50)e[1].BorderSizePixel=0 e[1].Text=""e[1].AutoButtonColor=false e[1].Parent=u[2]
		local f1=x[1](i6)f1.CornerRadius=x[9](0,6)f1.Parent=e[1]
		local f2=x[1](i7)f2.Color=x[4](60,60,80)f2.Thickness=1 f2.Parent=e[1]
		e[2]=x[1](i3)e[2].Size=x[6](1,-50,1,0)e[2].Position=x[7](12,0)e[2].BackgroundTransparency=1 e[2].Text=a e[2].Font=x[13]e[2].TextSize=13 e[2].TextColor3=x[4](220,220,230)e[2].TextXAlignment=x[14]e[2].Parent=e[1]
		e[3]=x[1](i2)e[3].Size=x[7](36,18)e[3].AnchorPoint=x[5](1,0.5)e[3].Position=x[6](1,-10,0.5,0)e[3].BackgroundColor3=b()and x[4](60,180,100)or x[4](80,80,100)e[3].BorderSizePixel=0 e[3].Parent=e[1]
		local f3=x[1](i6)f3.CornerRadius=x[9](1,0)f3.Parent=e[3]
		e[4]=x[1](i2)e[4].Size=x[7](14,14)e[4].AnchorPoint=x[5](0,0.5)e[4].Position=b()and x[6](1,-16,0.5,0)or x[6](0,2,0.5,0)e[4].BackgroundColor3=x[4](255,255,255)e[4].BorderSizePixel=0 e[4].Parent=e[3]
		local f4=x[1](i6)f4.CornerRadius=x[9](1,0)f4.Parent=e[4]
		e[5]=function(g)
			q[3]:Create(e[3],x[10](0.2),{BackgroundColor3=g and x[4](60,180,100)or x[4](80,80,100)}):Play()
			q[3]:Create(e[4],x[10](0.2),{Position=g and x[6](1,-16,0.5,0)or x[6](0,2,0.5,0)}):Play()
		end
		e[1].MouseButton1Click:Connect(function()local h=not b()c(h)e[5](h)end)
		return e
	end

	s[12]={}
	s[12][1]=F(i36,function()return s[3]end,function(y)s[3]=y end,40)
	s[12][2]=F(i37,function()return s[4]end,function(y)s[4]=y end,80)
	s[12][3]=F(i38,function()return s[5]end,function(y)s[5]=y if not y then s[7]=nil end end,120)

	local u1={}
	u1[1]=x[1](i3)u1[1].Size=x[6](1,-20,0,18)u1[1].Position=x[7](10,165)u1[1].BackgroundTransparency=1 u1[1].Text=i39.."125"u1[1].Font=x[13]u1[1].TextSize=12 u1[1].TextColor3=x[4](200,200,220)u1[1].TextXAlignment=x[14]u1[1].Parent=u[2]
	u1[2]=x[1](i2)u1[2].Size=x[6](1,-20,0,6)u1[2].Position=x[7](10,190)u1[2].BackgroundColor3=x[4](40,40,50)u1[2].BorderSizePixel=0 u1[2].Parent=u[2]
	local h1=x[1](i6)h1.CornerRadius=x[9](1,0)h1.Parent=u1[2]
	u1[3]=x[1](i2)u1[3].Size=x[8](0.5,1)u1[3].BackgroundColor3=x[4](160,120,255)u1[3].BorderSizePixel=0 u1[3].Parent=u1[2]
	local h2=x[1](i5)h2.Color=x[11](x[4](100,200,255),x[4](180,100,255))h2.Parent=u1[3]
	local h3=x[1](i6)h3.CornerRadius=x[9](1,0)h3.Parent=u1[3]
	u1[4]=x[1](i2)u1[4].Size=x[7](14,14)u1[4].AnchorPoint=x[5](0.5,0.5)u1[4].Position=x[8](0.5,0.5)u1[4].BackgroundColor3=x[4](255,255,255)u1[4].BorderSizePixel=0 u1[4].Parent=u1[2]
	local h4=x[1](i6)h4.CornerRadius=x[9](1,0)h4.Parent=u1[4]
	local h5=x[1](i7)h5.Color=x[4](180,100,255)h5.Thickness=2 h5.Parent=u1[4]
	local v1=16 local v2=250
	u1[5]=function(y)
		local z=math.clamp(y/u1[2].AbsoluteSize.X,0,1)
		local w=math.floor(v1+(v2-v1)*z)
		s[9]=w u1[3].Size=x[8](z,1)u1[4].Position=x[8](z,0.5)u1[1].Text=i39..w
	end
	local w1=false
	u1[2].InputBegan:Connect(function(y)if y.UserInputType==x[17]or y.UserInputType==x[18]then w1=true u1[5](y.Position.X-u1[2].AbsolutePosition.X)end end)
	u1[2].InputEnded:Connect(function(y)if y.UserInputType==x[17]or y.UserInputType==x[18]then w1=false end end)
	q[5].InputChanged:Connect(function(y)if not w1 then return end if y.UserInputType==x[19]or y.UserInputType==x[18]then u1[5](y.Position.X-u1[2].AbsolutePosition.X)end end)
	s[12][4]=F(i40,function()return s[8]end,function(y)s[8]=y local ch=q[6].Character local hu=ch and ch:FindFirstChildOfClass(i11)if hu then hu[i28]=y and s[9]or 16 end end,205)

	local u2={}
	u2[1]=x[1](i3)u2[1].Size=x[6](1,-20,0,20)u2[1].Position=x[7](10,250)u2[1].BackgroundTransparency=1 u2[1].Text=i49 u2[1].Font=x[13]u2[1].TextSize=12 u2[1].TextColor3=x[4](200,200,220)u2[1].TextXAlignment=x[14]u2[1].Parent=u[2]
	u2[2]=x[1](i8)u2[2].Position=x[7](10,274)u2[2].Size=x[6](1,-20,0,294)u2[2].BackgroundColor3=x[4](15,15,20)u2[2].BackgroundTransparency=0.2 u2[2].BorderSizePixel=0 u2[2].ScrollBarThickness=3 u2[2].ScrollBarImageColor3=x[4](100,100,120)u2[2].CanvasSize=x[6]()u2[2].Parent=u[2]
	local i1c=x[1](i6)i1c.CornerRadius=x[9](0,6)i1c.Parent=u2[2]
	local i2c=x[1](i9)i2c.PaddingTop=x[9](0,4)i2c.PaddingBottom=x[9](0,4)i2c.PaddingLeft=x[9](0,4)i2c.PaddingRight=x[9](0,4)i2c.Parent=u2[2]
	local i3c=x[1](i10)i3c.Padding=x[9](0,4)i3c.SortOrder=x[16]i3c.Parent=u2[2]
	s[13]=u s[14]=u1 s[15]=u2

	local function K(y)if not s[4]then return end if typeof(y)~="Vector3"then return end local ch=q[6].Character local r=ch and ch:FindFirstChild(i12)if not r then return end r.CFrame=x[2](y+x[3](0,3,0))end
	q[9].OnClientEvent:Connect(function(y)
		if type(y)~="table"then return end
		if y[i23]==i21 then
			table.clear(s[1])table.clear(s[2])
			for _,e in ipairs(y[i24]or{})do local id,pos=e[1],e[2]if id and not s[2][id]then s[2][id]=true table.insert(s[1],id)end if pos then K(pos)end end
			return
		end
		if y[i23]==i20 then
			for _,id in ipairs(y[i26]or{})do s[2][id]=nil for j,d in ipairs(s[1])do if d==id then table.remove(s[1],j)break end end end
			for _,e in ipairs(y[i25]or{})do local id,pos=e[1],e[2]if id and not s[2][id]then s[2][id]=true table.insert(s[1],id)end if pos then K(pos)end end
		end
	end)

	local function A()
		if not s[3]or#s[1]==0 then return end
		local b={}for i=1,math.min(12,#s[1])do table.insert(b,table.remove(s[1],1))end
		for _,id in ipairs(b)do s[2][id]=nil end
		q[8]:FireServer(i20,b)
	end
	local function N(hp)
		if not hp then return""end
		if hp:IsA(i15)then local l=hp:FindFirstChildWhichIsA(i3,true)if not l then return""end return tostring(l[i32])end
		if hp:IsA(i3)then return tostring(hp[i32])end
		if hp:IsA(i16)then return tostring(hp[i31])end
		return tostring(hp[i30])
	end
	local function D()
		local fs=workspace:FindFirstChild(i17)local en=fs and fs:FindFirstChild(i18)local r=q[6].Character and q[6].Character:FindFirstChild(i12)
		if not(en and r)then return nil end
		local best,bp,bd=nil,math.huge,math.huge
		for _,e in ipairs(en:GetChildren())do
			local hrp=e:FindFirstChild(i12)if not hrp then continue end
			local hd=e:FindFirstChild(i13)local hp=hd and hd:FindFirstChild(i14)if not hp then continue end
			local pr=s[11][N(hp)]if not pr then continue end
			local d=(hrp[i29]-r[i29]).Magnitude
			if pr<bp or(pr==bp and d<bd)then best,bp,bd=e,pr,d end
		end
		return best
	end
	local function W()
		if not s[5]then return end
		if q[6]:GetAttribute(i19)==true then return end
		local e=D()if not e then return end
		local ehrp=e:FindFirstChild(i12)local r=q[6].Character and q[6].Character:FindFirstChild(i12)if not(ehrp and r)then return end
		s[7]=e r.CFrame=ehrp.CFrame*x[2](0,3,3)s[6]=os.clock()q[8]:FireServer(i22)
	end
	local function R(i,e,txt,pr)
		local row=x[1](i2)row.Name=i41..i row.Size=x[6](1,0,0,24)row.BackgroundColor3=pr and x[4](40,70,50)or x[4](30,30,40)row.BorderSizePixel=0 row.LayoutOrder=i row.Parent=u2[2]
		local rc=x[1](i6)rc.CornerRadius=x[9](0,4)rc.Parent=row
		local lb=x[1](i3)lb.Size=x[6](1,-8,1,0)lb.Position=x[7](8,0)lb.BackgroundTransparency=1 lb.Text=txt lb.Font=x[13]lb.TextSize=11 lb.TextColor3=pr and x[4](140,255,140)or x[4](180,180,200)lb.TextXAlignment=x[14]lb.TextTruncate=x[15]lb.Parent=row
		if pr then local ind=x[1](i2)ind.Size=x[7](4,4)ind.AnchorPoint=x[5](1,0.5)ind.Position=x[6](1,-8,0.5,0)ind.BackgroundColor3=x[4](140,255,140)ind.BorderSizePixel=0 ind.Parent=row local ic=x[1](i6)ic.CornerRadius=x[9](1,0)ic.Parent=ind end
	end
	local function L()
		for _,c in ipairs(u2[2]:GetChildren())do if c:IsA(i2)then c:Destroy()end end
		local fs=workspace:FindFirstChild(i17)local en=fs and fs:FindFirstChild(i18)
		if not en then u2[2].CanvasSize=x[6]()return end
		local t={}
		for _,e in ipairs(en:GetChildren())do
			local hd=e:FindFirstChild(i13)local hp=hd and hd:FindFirstChild(i14)if not hp then continue end
			local txt=N(hp)if txt==""then continue end
			table.insert(t,{enemy=e,text=txt,priority=s[11][txt]})
		end
		table.sort(t,function(a,b)if a.priority and b.priority then return a.priority<b.priority end if a.priority then return true end if b.priority then return false end return a.text<b.text end)
		for i,v in ipairs(t)do R(i,v.enemy,v.text,v.priority)end
		u2[2].CanvasSize=x[6](0,0,0,i3c.AbsoluteContentSize.Y)
	end
	s[16]={A=A,W=W,L=L,D=D,N=N,K=K}
	task.spawn(function()while true do task.wait(0.15)A()end end)
	task.spawn(function()while true do task.wait(0.1)W()end end)
	task.spawn(function()while true do task.wait(1)L()end end)
	_[1]=s
end
return _
