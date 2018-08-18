COPY lab4.Airlines FROM stdin USING DELIMITERS '|';
ASA|Alaska Airlines
UAL|United Airlines
VRD|Virgin America
SWA|Southwest Airlines
JBU|JetBlue Airways
HAL|Hawaiian Airlines
FFT|Frontier Airlines
DAL|Delta Airlines
AAL|American Airlines
NKS|Spirit Airlines
\.

COPY lab4.Airports FROM stdin USING DELIMITERS '|';
BFL|Bakersfield|CA
BWI|Baltimore|MD
BMI|Bloomington|IL
BOS|Boston|MA
BUF|Buffalo|NY
COS|Colorado Springs|CO
GNV|Gainesville|FL
ITH|Ithaca|NY
TYS|Knoxville|TN
LAX|Los Angeles|CA
SFO|San Francisco|CA
JFK|New York|NY
\.

COPY lab4.Flights FROM stdin USING DELIMITERS '|';
VRD|120|BFL|COS|08:00:00|12:00:00
FFT|130|BFL|BWI|07:00:00|10:00:00
UAL|140|BFL|LAX|09:00:00|12:00:00
SWA|150|BWI|ITH|11:00:00|12:00:00
NKS|160|BFL|BWI|08:00:00|14:00:00
NKS|170|SFO|JFK|14:00:00|16:00:00
AAL|190|BMI|GNV|06:00:00|09:00:00
DAL|200|COS|BFL|11:00:00|14:00:00
VRD|210|BUF|COS|18:00:00|22:00:00
VRD|220|SFO|JFK|19:00:00|21:00:00
JBU|230|LAX|COS|20:00:00|22:00:00
FFT|240|ITH|COS|13:00:00|18:00:00
VRD|250|COS|BMI|18:00:00|23:00:00
UAL|260|BUF|ITH|05:00:00|10:00:00
JBU|270|BMI|COS|09:00:00|13:00:00
DAL|280|GNV|COS|12:00:00|15:00:00
NKS|290|BFL|ITH|17:00:00|18:00:00
SWA|300|BWI|COS|03:00:00|04:00:00
JBU|180|SFO|COS|16:00:00|20:00:00
AAL|310|COS|JFK|21:30:00|23:30:00
DAL|330|SFO|ITH|09:00:00|10:00:00
JBU|340|ITH|JFK|10:45:00|11:45:00
JBU|330|SFO|GNV|10:00:00|12:00:00
NKS|310|GNV|JFK|12:15:00|13:30:00
FFT|320|SFO|LAX|20:00:00|21:00:00
SWA|310|LAX|JFK|20:30:00|22:45:00
VRD|345|SFO|BWI|19:00:00|20:00:00
FFT|390|BWI|JFK|22:00:00|23:30:00
ASA|120|GNV|JFK|10:00:00|13:30:00
FFT|170|SFO|GNV|06:00:00|08:00:00
UAL|120|SFO|GNV|06:00:00|08:00:00 
DAL|190|COS|ITH|06:00:00|07:00:00
AAL|200|SFO|ITH|11:00:00|12:00:00
SWA|210|COS|ITH|02:00:00|03:00:00
NKS|220|BWI|ITH|22:30:00|23:30:00
AAL|230|BWI|SFO|22:00:00|23:00:00
UAL|150|JFK|SFO|19:00:00|20:00:00
ASA|260|JFK|SFO|15:00:00|16:00:00
AAL|280|JFK|SFO|19:00:00|21:00:00
UAL|290|BWI|SFO|20:00:00|21:00:00
NKS|140|BWI|SFO|12:00:00|14:00:00
\.

COPY lab4.Customers FROM stdin USING DELIMITERS '|';
100|John Cena|A
101|George Clooney|B
102|Jay Cutler|B
103|Dexter Jackson|A
104|Ronnie coleman|B
105|Flex Lewis|C
106|Shawn Rhoden|D
107|Phil Heath|B
108|Jim Gordon|C
109|Pamela Beesly|A
110|Dwight Schrute|A
111|Michael Scott|B
112|Andy Bernard|B
113|Phyllis Vance|C
114|Jim Halpert|D
115|Kelly Kapoor|D
116|Erin Hannon|A
117|Akhil Dixit|B
118|William Levinson|D
119|Tim Ferrell|B
120|Kevin Malone|D
121|Angela Kinsey|A
122|Steve Carell|A
123|Wendy Jackson|A
124|Stanley Hudson|A
125|Meredith Palmer|D
126|Tim Cook|A
127|Simon Chan|C
128|Anllela Sagra|C
129|Ron Weasley|B
130|Steve Cook|A
131|Harvey Spectre|D
132|Daniel Hardman|C
133|Louis Litt|B
134|Jessica Pearson|A
135|Katrina Bennett|D
136|Robin Taylor|C
137|Drew Powell|B
138|Samuel Jackson|A
139|Sadik Hadzovic|D
140|Craig Ferguson|C
\.

COPY lab4.Tickets FROM stdin USING DELIMITERS '|';
180|100|ASA|120|D20|120|True
181|111|VRD|250|K22|200|True
204|137|VRD|220|L22|100|True
205|137|AAL|200|K21|400|True
182|122|FFT|170|L24|514|True
183|123|UAL|120|B56|632|True
184|124|ASA|120|C45|728|True
185|125|FFT|170|E23|129|True
186|112|JBU|180|F43|229|True
187|113|DAL|190|G42|329|False
188|114|AAL|200|H24|122|True
189|115|SWA|210|J24|234|True
190|116|NKS|220|K03|819|False
191|117|AAL|230|F01|332|True
192|118|UAL|150|L04|453|True
193|119|VRD|250|L06|546|True
194|120|ASA|260|E07|678|False
195|125|NKS|220|E08|726|True
196|133|AAL|280|D09|112|True
197|134|UAL|290|D23|343|False
198|136|NKS|220|C34|412|True
199|138|AAL|310|G33|747|True
200|140|UAL|120|B29|695|True
201|139|ASA|120|C31|339|False
202|131|NKS|170|F17|882|False
206|139|VRD|220|F17|812|False
207|139|AAL|200|F17|831|False
208|139|FFT|170|L17|331|False
209|134|VRD|290|K21|123|False
210|131|FFT|170|B12|342|False
211|113|UAL|120|H11|178|False
212|113|NKS|220|B08|665|False
213|113|SWA|210|B45|212|False
214|113|ASA|120|K13|105|False
\.

