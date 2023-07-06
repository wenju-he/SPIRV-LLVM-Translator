; RUN: llvm-as %s -o %t.bc
; RUN: llvm-spirv %t.bc --spirv-ext=+SPV_INTEL_arbitrary_precision_integers -o %t.spv
; RUN: llvm-spirv %t.spv -to-text -o %t.spt
; RUN: FileCheck < %t.spt %s --check-prefix=CHECK-SPIRV

; RUN: llvm-spirv -r -emit-opaque-pointers %t.spv -o %t.rev.bc
; RUN: llvm-dis < %t.rev.bc | FileCheck %s --check-prefix=CHECK-LLVM

; RUN: llvm-spirv -spirv-text -r -emit-opaque-pointers %t.spt -o %t.rev.bc
; RUN: llvm-dis < %t.rev.bc | FileCheck %s --check-prefix=CHECK-LLVM

; CHECK-SPIRV: Capability ArbitraryPrecisionIntegersINTEL
; CHECK-SPIRV: Extension "SPV_INTEL_arbitrary_precision_integers"

; CHECK-SPIRV-DAG: TypeInt {{[0-9]+}} 13 0
; CHECK-SPIRV-DAG: TypeInt {{[0-9]+}} 58 0
; CHECK-SPIRV-DAG: TypeInt {{[0-9]+}} 30 0
; CHECK-SPIRV-DAG: TypeInt [[#I65:]] 65 0
; CHECK-SPIRV-DAG: TypeInt [[#I96:]] 96 0
; CHECK-SPIRV-DAG: TypeInt [[#I128:]] 128 0
; CHECK-SPIRV-DAG: TypeInt [[#I256:]] 256 0
; CHECK-SPIRV-DAG: TypeInt [[#I2048:]] 2048 0
; CHECK-SPIRV-DAG: TypeInt [[#I3000:]] 3000 0
; CHECK-SPIRV-DAG: TypeInt [[#I20970:]] 20970 0
; CHECK-SPIRV-DAG: Constant [[#I65]] [[#]] 1 0 1
; CHECK-SPIRV-DAG: Constant [[#I96]] [[#]] 4 0 1
; CHECK-SPIRV-DAG: Constant [[#I128]] [[#]] 1 0 0 0
; CHECK-SPIRV-DAG: Constant [[#I256]] [[#]] 1 0 0 0 0 0 0 0
; CHECK-SPIRV-DAG: Constant [[#I2048]] [[#]] 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
; CHECK-SPIRV-DAG: Constant [[#I3000]] [[#]] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4194304
; CHECK-SPIRV-DAG: Constant [[#I20970]] [[#]] 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 256

target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "spir64-unknown-unknown"

; CHECK-LLVM: @a = addrspace(1) global i13 0, align 2
@a = addrspace(1) global i13 0, align 2
; CHECK-LLVM: @b = addrspace(1) global i58 0, align 8
@b = addrspace(1) global i58 0, align 8
; CHECK-LLVM: @c = addrspace(1) global i48 0, align 8
@c = addrspace(1) global i48 0, align 8
@d = addrspace(1) global i96 0, align 8
@e = addrspace(1) global i128 0, align 8
@f = addrspace(1) global i256 0, align 8
@g = addrspace(1) global i2048 0, align 8
@h = addrspace(1) global i65 0, align 8
@i = addrspace(1) global i3000 0, align 8
@j = addrspace(1) global i20970 0, align 8

; Function Attrs: noinline nounwind optnone
; CHECK-LLVM: void @_Z4funci(i30 %a)
define spir_func void @_Z4funci(i30 %a) {
entry:
; CHECK-LLVM: %a.addr = alloca i30
  %a.addr = alloca i30, align 4
; CHECK-LLVM: store i30 %a, ptr %a.addr
  store i30 %a, i30* %a.addr, align 4
; CHECK-LLVM: store i30 1, ptr %a.addr
  store i30 1, i30* %a.addr, align 4
; CHECK-LLVM: store i48 -4294901761, ptr addrspace(1) @c
  store i48 -4294901761, i48 addrspace(1)* @c, align 8
  store i96 18446744073709551620, i96 addrspace(1)* @d, align 8
; CHECK-LLVM: store i96 18446744073709551620, ptr addrspace(1) @d
  store i128 1, i128 addrspace(1)* @e, align 8
; CHECK-LLVM: store i128 1, ptr addrspace(1) @e
  store i256 1, i256 addrspace(1)* @f, align 8
; CHECK-LLVM: store i256 1, ptr addrspace(1) @f
  store i2048 1, i2048 addrspace(1)* @g, align 8
; CHECK-LLVM: store i2048 1, ptr addrspace(1) @g
  store i65 -18446744073709551615, i65 addrspace(1)* @h, align 8
; CHECK-LLVM: store i65 -18446744073709551615, ptr addrspace(1) @h
  store i3000 307557980540279294232889703319188128660178473934208428941529507290014700153668237193840016959648364895607412313512951227128221045224559205896270620516337082808739837588961254353255830027840166730656182059939220104108619578923418753353272689302172594198324164702665735456123372112931626325928229001336686977155925668370229838484203276434155100588186194225960119470912775080602325495872090950732635120621977440871024563485182171283011102215933688567803148117944660987371672127930262890492608195186863705944202116045174275770965453046087141380685048949170655551377961378020138002577512563950397337411482000283436368555178753420853476885694765939958469025338558796061274167510540180157352895375592812002107611796210524652580145104498051665561832180530522128410920976917590052290663417660282734249250542625168875343680999691501456894825180813368722653062533792972293724769977822878099943468044629754557497344, i3000 addrspace(1)* @i, align 8
; CHECK-LLVM: store i3000 307557980540279294232889703319188128660178473934208428941529507290014700153668237193840016959648364895607412313512951227128221045224559205896270620516337082808739837588961254353255830027840166730656182059939220104108619578923418753353272689302172594198324164702665735456123372112931626325928229001336686977155925668370229838484203276434155100588186194225960119470912775080602325495872090950732635120621977440871024563485182171283011102215933688567803148117944660987371672127930262890492608195186863705944202116045174275770965453046087141380685048949170655551377961378020138002577512563950397337411482000283436368555178753420853476885694765939958469025338558796061274167510540180157352895375592812002107611796210524652580145104498051665561832180530522128410920976917590052290663417660282734249250542625168875343680999691501456894825180813368722653062533792972293724769977822878099943468044629754557497344, ptr addrspace(1) @i
  store i20970 992999620131750473815229664075489009136335964930601292652448291630426253889216633314826452099385437512108307751385700008210777088198950852416756993106777532452166971180339481547729717472430926120069566708084768721091158483456180132456900166921064170356253710329014516914611602437118898173213450554683520694142351259777117399933202299321503679689921375146697488099391767735791080134857348483573458700239444949262311136074327730798419223282931354923297838070865115058640859020443189736871431666848885704361764831598954379353720610716235683212041262536747812618656776869090886477751144268696746387275480481070273733341504572901196536945414358001340689535511022665895626455268649424970129971928699595698100053229417613888025455042616392920340815983030517269194804400094340999515453007897327144456260394354743034429613166713339137123973767308819222401531165080139144568687881212960880391110973507901613562422904242358448329493367333432769425972765417223309828470149595670732429282106683605248114957719833776122373188338583370107470500960093631639679589741847559679170006182441552798602518461247802661642830666460139382261706062644902753977967459979553648637818374546606230866139876137853455589999819507707410522938829999667429569656413058184842029322964959829437040644892348324494764257561819215995533348729668529399154048635244868451399553902460611091420683800522919216312400775805110546334532970722908861596527134088436136014327185387199228527687414170879905772526402256213353167482570793412642586868457496633680422358894092223787255034053613836385343340190280360426979037228302691741006701850167979161853872928151056147094868400008311828912086041310688248179533145584091385688313869520967104240388792510267724369921724627353452291475193661470971707389385432274204931458700321574817859691637444849580082147241245842853174319528138449525668767346462769124319344353163509886012010194189090355760254199557022645788882845544961846094894372111061499704566163148357912929513840327281346086510158358828958975697204547509208081672900873821102015102352091128030786799223508892856306892709593906677194615582935273382617296960654159018160729791027881681542928438680279155467994455193797132110301150835969667739340187490999745078544061044535501219619336263907224519160245491688310651206349891418737604333558699578058407713400323788346947555441829197879370353777476836128033719245954116886563537434846471242408015557568989292692757450027512940238605693427565283916353185707882380994203825713646501471877339296703437800659102682180128110323288372464518977096260387957014283544930677476177460669380230398535522853515868483978205760693599952466199869950359036408257692541610339759950151444888252847375669894226710917177157553520918586351423121522050917353289820447442041148193767197765453757203200891565578572736262583950538738870290614620043846587149082266906227811164849040955337652091072736093323650717421074550285683025358187690112071480555968958423898139769651011232104091320249470609747717611182659031793642687041057171193040945965739569242093812130363573516802956454906410533892837510882307406475870088297616199357662952903069033353228722808340885383866692706950729775529166300791901511317739529769114086429791803763593109020826173645360272191697910188231254721988860588083235603286423507258317806971197439342302326860136973038494235019233599951320471671918205007482770650439753100595931261962925790178634645194348388099046269264340352107559871610051710660749890998384213725409476780259200166254627061833831014091512137739640955405259827789820868790210473084222543383973142584469735409427537913994446679765216223394350502825587896780323177323917441181314748441358554324827960459881164772394532077206068450507666578334326269624292329781061024537210111973241348334978679579747791892104823817723259025985900583616211845816922050024074939330318288097128373017523049107899795813890717257649866060348158801586759984315303214406662249881873434136550662171046907905379737104762298912160114738652297996132731406380282369135153485923296863113376088488878038562415290168077832523965520690382784352325729174947116218554583262627521343809633554605991363558530224763880161533766700612204738290060810979506210647333379373372404098044439054369711553465896690269173785724406603196667812718557001500061952809159105945925100988092570974549856536192318555264179047173499478846079669941034652326712601791467305227322011739745129130520192298000236846955462995457245632466730164436697631700763262335045657361716729474265386460458351255628635715251381738947652869744237007122773323322431043254413533781899767659625921640741146242472090400003782583170017538858696187104455264870759416545708798821207824013460932298943912580835246308391230249943078821783378821447594334011516728496466640660575749655768199496978412295031864369753580294173373103558007166031243071866373649815104224825990243694161863977165892231007915065027911958375458378663474519360211251966716603108098102847204574867782355078871449626175827486214396795372280651812992299666156773023876906060224603492574733855989567413838656827452784392325786066450846404110696241651777482790410808958110298156840167101761984188081930474928401127998893297421010844774388872386212228607916095256802836526943718673610807590892033348199517440999503413751384910026973859949142900410310432219666429887608798340649632736929369488438140883130393929796137318511826723829705011895649518824169936806874201196747626888019157054741740347337088921803306209541039860546364363157602815527984044429092413172259826220229025200083186128101465525672765636071077992087910080919771611091115246849327399639810892970516405927739739759979841374226532286843694058984801786289265093788882452584647612880335308514900584808553828816333398374886061798409068227357740572096018987837228579915848057471513868983517589677130551416801247458774240533031689624410582091975800679912964843972338074204791554838505958414769053263636041270745087461336596434602594734863374248927126813752469582336977550099794699726060374759922655365434328839441110861505480087225057083396399023402600530721101697571849746417713413569029009286589431293244076177660578611593661713911519855584725363759433174230587338453124268789271156078624738564306355162969836602238170348690419071068546686358815069614202930541174705702037279050014664152407184448847609868, i20970 addrspace(1)* @j, align 8
; CHECK-LLVM: store i20970 992999620131750473815229664075489009136335964930601292652448291630426253889216633314826452099385437512108307751385700008210777088198950852416756993106777532452166971180339481547729717472430926120069566708084768721091158483456180132456900166921064170356253710329014516914611602437118898173213450554683520694142351259777117399933202299321503679689921375146697488099391767735791080134857348483573458700239444949262311136074327730798419223282931354923297838070865115058640859020443189736871431666848885704361764831598954379353720610716235683212041262536747812618656776869090886477751144268696746387275480481070273733341504572901196536945414358001340689535511022665895626455268649424970129971928699595698100053229417613888025455042616392920340815983030517269194804400094340999515453007897327144456260394354743034429613166713339137123973767308819222401531165080139144568687881212960880391110973507901613562422904242358448329493367333432769425972765417223309828470149595670732429282106683605248114957719833776122373188338583370107470500960093631639679589741847559679170006182441552798602518461247802661642830666460139382261706062644902753977967459979553648637818374546606230866139876137853455589999819507707410522938829999667429569656413058184842029322964959829437040644892348324494764257561819215995533348729668529399154048635244868451399553902460611091420683800522919216312400775805110546334532970722908861596527134088436136014327185387199228527687414170879905772526402256213353167482570793412642586868457496633680422358894092223787255034053613836385343340190280360426979037228302691741006701850167979161853872928151056147094868400008311828912086041310688248179533145584091385688313869520967104240388792510267724369921724627353452291475193661470971707389385432274204931458700321574817859691637444849580082147241245842853174319528138449525668767346462769124319344353163509886012010194189090355760254199557022645788882845544961846094894372111061499704566163148357912929513840327281346086510158358828958975697204547509208081672900873821102015102352091128030786799223508892856306892709593906677194615582935273382617296960654159018160729791027881681542928438680279155467994455193797132110301150835969667739340187490999745078544061044535501219619336263907224519160245491688310651206349891418737604333558699578058407713400323788346947555441829197879370353777476836128033719245954116886563537434846471242408015557568989292692757450027512940238605693427565283916353185707882380994203825713646501471877339296703437800659102682180128110323288372464518977096260387957014283544930677476177460669380230398535522853515868483978205760693599952466199869950359036408257692541610339759950151444888252847375669894226710917177157553520918586351423121522050917353289820447442041148193767197765453757203200891565578572736262583950538738870290614620043846587149082266906227811164849040955337652091072736093323650717421074550285683025358187690112071480555968958423898139769651011232104091320249470609747717611182659031793642687041057171193040945965739569242093812130363573516802956454906410533892837510882307406475870088297616199357662952903069033353228722808340885383866692706950729775529166300791901511317739529769114086429791803763593109020826173645360272191697910188231254721988860588083235603286423507258317806971197439342302326860136973038494235019233599951320471671918205007482770650439753100595931261962925790178634645194348388099046269264340352107559871610051710660749890998384213725409476780259200166254627061833831014091512137739640955405259827789820868790210473084222543383973142584469735409427537913994446679765216223394350502825587896780323177323917441181314748441358554324827960459881164772394532077206068450507666578334326269624292329781061024537210111973241348334978679579747791892104823817723259025985900583616211845816922050024074939330318288097128373017523049107899795813890717257649866060348158801586759984315303214406662249881873434136550662171046907905379737104762298912160114738652297996132731406380282369135153485923296863113376088488878038562415290168077832523965520690382784352325729174947116218554583262627521343809633554605991363558530224763880161533766700612204738290060810979506210647333379373372404098044439054369711553465896690269173785724406603196667812718557001500061952809159105945925100988092570974549856536192318555264179047173499478846079669941034652326712601791467305227322011739745129130520192298000236846955462995457245632466730164436697631700763262335045657361716729474265386460458351255628635715251381738947652869744237007122773323322431043254413533781899767659625921640741146242472090400003782583170017538858696187104455264870759416545708798821207824013460932298943912580835246308391230249943078821783378821447594334011516728496466640660575749655768199496978412295031864369753580294173373103558007166031243071866373649815104224825990243694161863977165892231007915065027911958375458378663474519360211251966716603108098102847204574867782355078871449626175827486214396795372280651812992299666156773023876906060224603492574733855989567413838656827452784392325786066450846404110696241651777482790410808958110298156840167101761984188081930474928401127998893297421010844774388872386212228607916095256802836526943718673610807590892033348199517440999503413751384910026973859949142900410310432219666429887608798340649632736929369488438140883130393929796137318511826723829705011895649518824169936806874201196747626888019157054741740347337088921803306209541039860546364363157602815527984044429092413172259826220229025200083186128101465525672765636071077992087910080919771611091115246849327399639810892970516405927739739759979841374226532286843694058984801786289265093788882452584647612880335308514900584808553828816333398374886061798409068227357740572096018987837228579915848057471513868983517589677130551416801247458774240533031689624410582091975800679912964843972338074204791554838505958414769053263636041270745087461336596434602594734863374248927126813752469582336977550099794699726060374759922655365434328839441110861505480087225057083396399023402600530721101697571849746417713413569029009286589431293244076177660578611593661713911519855584725363759433174230587338453124268789271156078624738564306355162969836602238170348690419071068546686358815069614202930541174705702037279050014664152407184448847609868, ptr addrspace(1) @j
  ret void
}