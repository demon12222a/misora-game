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

	-- グローバル間接参照（math/table/string/task/os も隠す）
	local G=(function()
		local g={}
		g[1]=math.clamp
		g[2]=math.floor
		g[3]=math.huge
		g[4]=math.min
		g[5]=table.clear
		g[6]=table.insert
		g[7]=table.remove
		g[8]=table.sort
		g[9]=table.unpack
		g[10]=string.char
		g[11]=task.spawn
		g[12]=task.wait
		g[13]=os.clock
		g[14]=typeof
		g[15]=tostring
		g[16]=ipairs
		g[17]=type
		return g
	end)()

	-- 文字列テーブル（キーをシャッフル、IIFEで閉じ込め）
	local S=(function()
		local f=G[10]
		local r={
			[7]={83,99,114,101,101,110,71,117,105},
			[22]={70,114,97,109,101},
			[3]={84,101,120,116,76,97,98,101,108},
			[15]={84,101,120,116,66,117,116,116,111,110},
			[41]={85,73,71,114,97,100,105,101,110,116},
			[9]={85,73,67,111,114,110,101,114},
			[33]={85,73,83,116,114,111,107,101},
			[18]={83,99,114,111,108,108,105,110,103,70,114,97,109,101},
			[5]={85,73,80,97,100,100,105,110,103},
			[28]={85,73,76,105,115,116,76,97,121,111,117,116},
			[11]={72,117,109,97,110,111,105,100},
			[36]={72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116},
			[2]={72,101,97,100},
			[47]={72,80},
			[13]={66,105,108,108,98,111,97,114,100,71,117,105},
			[30]={83,116,114,105,110,103,86,97,108,117,101},
			[25]={70,105,101,108,100,83,116,117,102,102},
			[40]={69,110,101,109,105,101,115},
			[6]={77,105,115,111,114,97,73,110,71,97,109,101},
			[20]={99,111,105,110,115},
			[44]={99,111,105,110,115,65,108,108},
			[8]={115,119,105,110,103},
			[14]={107,105,110,100},
			[38]={108,105,115,116},
			[31]={97,100,100},
			[16]={100,101,108},
			[26]={80,108,97,121,101,114,71,117,105},
			[1]={87,97,108,107,83,112,101,101,100},
			[4]={80,111,115,105,116,105,111,110},
			[29]={78,97,109,101},
			[48]={86,97,108,117,101},
			[12]={84,101,120,116},
			[27]={95,95,110,101,119,105,110,100,101,120},
			[35]={97,117,116,111,32,102,97,114,109,32,103,117,105},
			[23]={80,97,110,101,108},
			[46]={65,117,116,111,32,67,111,105,110},
			[10]={65,117,116,111,32,84,101,108,101,112,111,114,116},
			[17]={69,110,101,109,121,32,84,80,32,43,32,83,119,105,110,103},
			[43]={87,97,108,107,83,112,101,101,100,58,32},
			[24]={83,112,101,101,100},
			[32]={82,111,119,95},
			[49]={227,129,138,227,129,147,227,129,163,227,129,166,227,129,139,227,130,181,227,131,149,227,131,188,227,131,171},
			[37]={227,129,138,227,129,147,227,129,163,227,129,166,227,130,181,227,131,149,227,131,188,227,131,171},
			[19]={227,129,138,227,129,147,227,129,163,227,129,166,227,129,161,227,129,179,227,130,181,227,131,149,227,131,188,227,131,171},
			[45]={227,129,167,227,129,139,227,130,181,227,131,149,227,131,188,227,131,171},
			[21]={227,130,181,227,131,149,227,131,188,227,131,171},
			[34]={227,129,161,227,129,179,227,130,181,227,131,149,227,131,188,227,131,171},
			[39]={227,129,191,227,129,157,227,131,129,227,131,188,240,159,164,147},
			[42]={227,130,181,227,131,188,227,131,144,227,131,188,227,130,173,227,131,163,227,131,169,232,161,168},
		}
		local t={}
		for i,v in G[16](r)do t[i]=f(G[9](v))end
		return t
	end)()

	-- Instance/CFrame等（キーもシャッフル）
	local x=(function()
		local t={}
		t[6]=Instance.new
		t[14]=CFrame.new
		t[2]=Vector3.new
		t[9]=Color3.fromRGB
		t[17]=Vector2.new
		t[1]=UDim2.new
		t[11]=UDim2.fromOffset
		t[5]=UDim2.fromScale
		t[8]=UDim.new
		t[3]=TweenInfo.new
		t[12]=ColorSequence.new
		t[16]=Enum.Font.GothamBlack
		t[7]=Enum.Font.GothamBold
		t[4]=Enum.TextXAlignment.Left
		t[15]=Enum.TextTruncate.AtEnd
		t[10]=Enum.SortOrder.LayoutOrder
		t[13]=Enum.UserInputType.MouseButton1
		t[18]=Enum.UserInputType.Touch
		t[19]=Enum.UserInputType.MouseMovement
		return t
	end)()

	-- 文字列エイリアス（シャッフルされたキーから取得）
	local i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30,i31,i32,i33,i34,i35,i36,i37,i38,i39,i40,i41,i42,i43,i44,i45,i46,i47,i48,i49=
		S[1],S[2],S[3],S[4],S[5],S[6],S[7],S[8],S[9],S[10],S[11],S[12],S[13],S[14],S[15],S[16],S[17],S[18],S[19],S[20],S[21],S[22],S[23],S[24],S[25],S[26],S[27],S[28],S[29],S[30],S[31],S[32],S[33],S[34],S[35],S[36],S[37],S[38],S[39],S[40],S[41],S[42],S[43],S[44],S[45],S[46],S[47],S[48],S[49]

	local _0=q[6]:WaitForChild(i26):FindFirstChild(i35)
	if _0 then _0:Destroy()end

	local s={}
	s[1]={}s[2]={}
	s[3]=false s[4]=false s[5]=false s[6]=0 s[7]=nil s[8]=false s[9]=0x7D
	s[10]={i49,i37,i19,i45,i21,i34}
	s[11]={}
	for i,v in G[16](s[10])do s[11][v]=i end

	local _1
	_1=hookmetamethod(game,i27,newcclosure(function(a,b,c)if b==i1 then if checkcaller()then return _1(a,b,c)end return end return _1(a,b,c)end))

	G[11](function()while true do q[4].Heartbeat:Wait()if s[8]then local ch=q[6].Character local hu=ch and ch:FindFirstChildOfClass(i11)if hu and hu[i1]~=s[9]then hu[i1]=s[9] end end end end)

	local u={}
	u[1]=x[6](i7)u[1].Name=i35 u[1].ResetOnSpawn=false u[1].IgnoreGuiInset=true u[1].DisplayOrder=0x64 u[1].Parent=q[6]:WaitForChild(i26)
	u[2]=x[6](i22)u[2].Name=i23 u[2].AnchorPoint=x[17](0,0)u[2].Position=x[11](0x14,0x78)u[2].Size=x[11](0xDC,0x244)u[2].BackgroundColor3=x[9](0x19,0x19,0x20)u[2].BackgroundTransparency=0.05 u[2].BorderSizePixel=0 u[2].Active=true u[2].Draggable=true u[2].Parent=u[1]

	local g1=x[6](i41)g1.Color=x[12](x[9](0x23,0x23,0x2D),x[9](0xF,0xF,0x14))g1.Rotation=0x5A g1.Parent=u[2]
	local g2=x[6](i9)g2.CornerRadius=x[8](0,0xA)g2.Parent=u[2]
	local g3=x[6](i33)g3.Color=x[9](0x46,0x46,0x5A)g3.Thickness=1.5 g3.Transparency=0.5 g3.Parent=u[2]
	local g4=x[6](i3)g4.Size=x[1](1,0,0,0x24)g4.BackgroundTransparency=1 g4.Text=i39 g4.Font=x[16]g4.TextSize=0x10 g4.TextColor3=x[9](0xFF,0xFF,0xFF)g4.Parent=u[2]
	local g5=x[6](i41)g5.Color=x[12](x[9](0xA0,0xDC,0xFF),x[9](0xC8,0xA0,0xFF))g5.Parent=g4

	local function F(a,b,c,d)
		local e={}
		e[1]=x[6](i15)e[1].Size=x[1](1,-0x14,0,0x24)e[1].Position=x[11](0xA,d)e[1].BackgroundColor3=x[9](0x28,0x28,0x32)e[1].BorderSizePixel=0 e[1].Text=""e[1].AutoButtonColor=false e[1].Parent=u[2]
		local f1=x[6](i9)f1.CornerRadius=x[8](0,6)f1.Parent=e[1]
		local f2=x[6](i33)f2.Color=x[9](0x3C,0x3C,0x50)f2.Thickness=1 f2.Parent=e[1]
		e[2]=x[6](i3)e[2].Size=x[1](1,-0x32,1,0)e[2].Position=x[11](0xC,0)e[2].BackgroundTransparency=1 e[2].Text=a e[2].Font=x[7]e[2].TextSize=0xD e[2].TextColor3=x[9](0xDC,0xDC,0xE6)e[2].TextXAlignment=x[4]e[2].Parent=e[1]
		e[3]=x[6](i22)e[3].Size=x[11](0x24,0x12)e[3].AnchorPoint=x[17](1,0.5)e[3].Position=x[1](1,-0xA,0.5,0)e[3].BackgroundColor3=b()and x[9](0x3C,0xB4,0x64)or x[9](0x50,0x50,0x64)e[3].BorderSizePixel=0 e[3].Parent=e[1]
		local f3=x[6](i9)f3.CornerRadius=x[8](1,0)f3.Parent=e[3]
		e[4]=x[6](i22)e[4].Size=x[11](0xE,0xE)e[4].AnchorPoint=x[17](0,0.5)e[4].Position=b()and x[1](1,-0x10,0.5,0)or x[1](0,2,0.5,0)e[4].BackgroundColor3=x[9](0xFF,0xFF,0xFF)e[4].BorderSizePixel=0 e[4].Parent=e[3]
		local f4=x[6](i9)f4.CornerRadius=x[8](1,0)f4.Parent=e[4]
		e[5]=function(g)
			q[3]:Create(e[3],x[3](0.2),{BackgroundColor3=g and x[9](0x3C,0xB4,0x64)or x[9](0x50,0x50,0x64)}):Play()
			q[3]:Create(e[4],x[3](0.2),{Position=g and x[1](1,-0x10,0.5,0)or x[1](0,2,0.5,0)}):Play()
		end
		e[1].MouseButton1Click:Connect(function()local h=not b()c(h)e[5](h)end)
		return e
	end

	s[12]={}
	s[12][1]=F(i46,function()return s[3]end,function(y)s[3]=y end,0x28)
	s[12][2]=F(i10,function()return s[4]end,function(y)s[4]=y end,0x50)
	s[12][3]=F(i17,function()return s[5]end,function(y)s[5]=y if not y then s[7]=nil end end,0x78)

	local u1={}
	u1[1]=x[6](i3)u1[1].Size=x[1](1,-0x14,0,0x12)u1[1].Position=x[11](0xA,0xA5)u1[1].BackgroundTransparency=1 u1[1].Text=i43.."125"u1[1].Font=x[7]u1[1].TextSize=0xC u1[1].TextColor3=x[9](0xC8,0xC8,0xDC)u1[1].TextXAlignment=x[4]u1[1].Parent=u[2]
	u1[2]=x[6](i22)u1[2].Size=x[1](1,-0x14,0,6)u1[2].Position=x[11](0xA,0xBE)u1[2].BackgroundColor3=x[9](0x28,0x28,0x32)u1[2].BorderSizePixel=0 u1[2].Parent=u[2]
	local h1=x[6](i9)h1.CornerRadius=x[8](1,0)h1.Parent=u1[2]
	u1[3]=x[6](i22)u1[3].Size=x[5](0.5,1)u1[3].BackgroundColor3=x[9](0xA0,0x78,0xFF)u1[3].BorderSizePixel=0 u1[3].Parent=u1[2]
	local h2=x[6](i41)h2.Color=x[12](x[9](0x64,0xC8,0xFF),x[9](0xB4,0x64,0xFF))h2.Parent=u1[3]
	local h3=x[6](i9)h3.CornerRadius=x[8](1,0)h3.Parent=u1[3]
	u1[4]=x[6](i22)u1[4].Size=x[11](0xE,0xE)u1[4].AnchorPoint=x[17](0.5,0.5)u1[4].Position=x[5](0.5,0.5)u1[4].BackgroundColor3=x[9](0xFF,0xFF,0xFF)u1[4].BorderSizePixel=0 u1[4].Parent=u1[2]
	local h4=x[6](i9)h4.CornerRadius=x[8](1,0)h4.Parent=u1[4]
	local h5=x[6](i33)h5.Color=x[9](0xB4,0x64,0xFF)h5.Thickness=2 h5.Parent=u1[4]
	local v1=0x10 local v2=0xFA
	u1[5]=function(y)
		local z=G[1](y/u1[2].AbsoluteSize.X,0,1)
		local w=G[2](v1+(v2-v1)*z)
		s[9]=w u1[3].Size=x[5](z,1)u1[4].Position=x[5](z,0.5)u1[1].Text=i43..w
	end
	local w1=false
	u1[2].InputBegan:Connect(function(y)if y.UserInputType==x[13]or y.UserInputType==x[18]then w1=true u1[5](y.Position.X-u1[2].AbsolutePosition.X)end end)
	u1[2].InputEnded:Connect(function(y)if y.UserInputType==x[13]or y.UserInputType==x[18]then w1=false end end)
	q[5].InputChanged:Connect(function(y)if not w1 then return end if y.UserInputType==x[19]or y.UserInputType==x[18]then u1[5](y.Position.X-u1[2].AbsolutePosition.X)end end)
	s[12][4]=F(i24,function()return s[8]end,function(y)s[8]=y local ch=q[6].Character local hu=ch and ch:FindFirstChildOfClass(i11)if hu then hu[i1]=y and s[9]or 0x10 end end,0xCD)

	local u2={}
	u2[1]=x[6](i3)u2[1].Size=x[1](1,-0x14,0,0x14)u2[1].Position=x[11](0xA,0xFA)u2[1].BackgroundTransparency=1 u2[1].Text=i42 u2[1].Font=x[7]u2[1].TextSize=0xC u2[1].TextColor3=x[9](0xC8,0xC8,0xDC)u2[1].TextXAlignment=x[4]u2[1].Parent=u[2]
	u2[2]=x[6](i18)u2[2].Position=x[11](0xA,0x112)u2[2].Size=x[1](1,-0x14,0,0x126)u2[2].BackgroundColor3=x[9](0xF,0xF,0x14)u2[2].BackgroundTransparency=0.2 u2[2].BorderSizePixel=0 u2[2].ScrollBarThickness=3 u2[2].ScrollBarImageColor3=x[9](0x64,0x64,0x78)u2[2].CanvasSize=x[1]()u2[2].Parent=u[2]
	local i1c=x[6](i9)i1c.CornerRadius=x[8](0,6)i1c.Parent=u2[2]
	local i2c=x[6](i5)i2c.PaddingTop=x[8](0,4)i2c.PaddingBottom=x[8](0,4)i2c.PaddingLeft=x[8](0,4)i2c.PaddingRight=x[8](0,4)i2c.Parent=u2[2]
	local i3c=x[6](i28)i3c.Padding=x[8](0,4)i3c.SortOrder=x[10]i3c.Parent=u2[2]
	s[13]=u s[14]=u1 s[15]=u2

	local function K(y)if not s[4]then return end if G[14](y)~="Vector3"then return end local ch=q[6].Character local r=ch and ch:FindFirstChild(i36)if not r then return end r.CFrame=x[14](y+x[2](0,3,0))end
	q[9].OnClientEvent:Connect(function(y)
		if G[17](y)~="table"then return end
		if y[i14]==i44 then
			G[5](s[1])G[5](s[2])
			for _,e in G[16](y[i38]or{})do local id,pos=e[1],e[2]if id and not s[2][id]then s[2][id]=true G[6](s[1],id)end if pos then K(pos)end end
			return
		end
		if y[i14]==i20 then
			for _,id in G[16](y[i16]or{})do s[2][id]=nil for j,d in G[16](s[1])do if d==id then G[7](s[1],j)break end end end
			for _,e in G[16](y[i31]or{})do local id,pos=e[1],e[2]if id and not s[2][id]then s[2][id]=true G[6](s[1],id)end if pos then K(pos)end end
		end
	end)

	local function A()
		if not s[3]or#s[1]==0 then return end
		local b={}for i=1,G[4](0xC,#s[1])do G[6](b,G[7](s[1],1))end
		for _,id in G[16](b)do s[2][id]=nil end
		q[8]:FireServer(i20,b)
	end
	local function N(hp)
		if not hp then return""end
		if hp:IsA(i13)then local l=hp:FindFirstChildWhichIsA(i3,true)if not l then return""end return G[15](l[i12])end
		if hp:IsA(i3)then return G[15](hp[i12])end
		if hp:IsA(i30)then return G[15](hp[i48])end
		return G[15](hp[i29])
	end
	local function D()
		local fs=workspace:FindFirstChild(i25)local en=fs and fs:FindFirstChild(i40)local r=q[6].Character and q[6].Character:FindFirstChild(i36)
		if not(en and r)then return nil end
		local best,bp,bd=nil,G[3],G[3]
		for _,e in G[16](en:GetChildren())do
			local hrp=e:FindFirstChild(i36)if not hrp then continue end
			local hd=e:FindFirstChild(i2)local hp=hd and hd:FindFirstChild(i47)if not hp then continue end
			local pr=s[11][N(hp)]if not pr then continue end
			local d=(hrp[i4]-r[i4]).Magnitude
			if pr<bp or(pr==bp and d<bd)then best,bp,bd=e,pr,d end
		end
		return best
	end
	local function W()
		if not s[5]then return end
		if q[6]:GetAttribute(i6)==true then return end
		local e=D()if not e then return end
		local ehrp=e:FindFirstChild(i36)local r=q[6].Character and q[6].Character:FindFirstChild(i36)if not(ehrp and r)then return end
		s[7]=e r.CFrame=ehrp.CFrame*x[14](0,3,3)s[6]=G[13]()q[8]:FireServer(i8)
	end
	local function R(i,e,txt,pr)
		local row=x[6](i22)row.Name=i32..i row.Size=x[1](1,0,0,0x18)row.BackgroundColor3=pr and x[9](0x28,0x46,0x32)or x[9](0x1E,0x1E,0x28)row.BorderSizePixel=0 row.LayoutOrder=i row.Parent=u2[2]
		local rc=x[6](i9)rc.CornerRadius=x[8](0,4)rc.Parent=row
		local lb=x[6](i3)lb.Size=x[1](1,-8,1,0)lb.Position=x[11](8,0)lb.BackgroundTransparency=1 lb.Text=txt lb.Font=x[7]lb.TextSize=0xB lb.TextColor3=pr and x[9](0x8C,0xFF,0x8C)or x[9](0xB4,0xB4,0xC8)lb.TextXAlignment=x[4]lb.TextTruncate=x[15]lb.Parent=row
		if pr then local ind=x[6](i22)ind.Size=x[11](4,4)ind.AnchorPoint=x[17](1,0.5)ind.Position=x[1](1,-8,0.5,0)ind.BackgroundColor3=x[9](0x8C,0xFF,0x8C)ind.BorderSizePixel=0 ind.Parent=row local ic=x[6](i9)ic.CornerRadius=x[8](1,0)ic.Parent=ind end
	end
	local function L()
		for _,c in G[16](u2[2]:GetChildren())do if c:IsA(i22)then c:Destroy()end end
		local fs=workspace:FindFirstChild(i25)local en=fs and fs:FindFirstChild(i40)
		if not en then u2[2].CanvasSize=x[1]()return end
		local t={}
		for _,e in G[16](en:GetChildren())do
			local hd=e:FindFirstChild(i2)local hp=hd and hd:FindFirstChild(i47)if not hp then continue end
			local txt=N(hp)if txt==""then continue end
			G[6](t,{enemy=e,text=txt,priority=s[11][txt]})
		end
		G[8](t,function(a,b)if a.priority and b.priority then return a.priority<b.priority end if a.priority then return true end if b.priority then return false end return a.text<b.text end)
		for i,v in G[16](t)do R(i,v.enemy,v.text,v.priority)end
		u2[2].CanvasSize=x[1](0,0,0,i3c.AbsoluteContentSize.Y)
	end
	s[16]={A=A,W=W,L=L,D=D,N=N,K=K}
	G[11](function()while true do G[12](0.15)A()end end)
	G[11](function()while true do G[12](0.1)W()end end)
	G[11](function()while true do G[12](1)L()end end)
	_[1]=s
end
return _
