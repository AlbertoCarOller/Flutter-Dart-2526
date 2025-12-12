import '../models/stranger_character.dart';

// Lista completa de 24 personajes con datos detallados hasta el final de la Temporada 3.
final List<StrangerCharacter> charactersList = [
  // 1. Mike Wheeler
  const StrangerCharacter(
    firstName: 'Mike',
    lastName: 'Wheeler',
    gridImageUrl: 'Mike.webp',
    shortDescription: 'El líder leal del grupo y estratega. Novio de Eleven.',
    isAliveInSeason3: true,
    hasPowers: false,
    longBio: "Michael 'Mike' Wheeler es el corazón palpitante y el líder de facto de su grupo de amigos en Hawkins. Su vida cambió irrevocablemente en 1983 cuando, tras la desaparición de su mejor amigo Will Byers, encontró a una misteriosa niña rapada llamada Eleven en el bosque bajo la lluvia. Desafiando el peligro, la escondió en su sótano, desarrollando un vínculo inquebrantable con ella y descubriendo el mundo sobrenatural del Upside Down. Su determinación fue clave para encontrar a Will y derrotar al Demogorgon inicial.\n\n"
        "Un año después, Mike luchó contra la depresión por la supuesta muerte de Eleven, llamándola por radio todos los días durante casi un año sin respuesta. Su emotivo reencuentro al final de la segunda temporada solidificó su relación. Durante la crisis del 'Mind Flayer' en 1984, Mike utilizó su conocimiento de Dungeons & Dragons para deducir la naturaleza de mente colmena del monstruo, siendo crucial para liberar a Will de su posesión.\n\n"
        "En el verano de 1985 (Temporada 3), Mike se centra en su intenso romance adolescente con Eleven, lo que causa fricciones con el jefe Hopper y con Will, quien se siente abandonado. Cuando el Mind Flayer regresa, Mike vuelve a asumir el liderazgo táctico, mostrando una profunda preocupación por la seguridad de Eleven y temiendo que el uso excesivo de sus poderes la mate. Al final de la temporada, sufre una dolorosa separación cuando Eleven, ahora sin poderes y tras la aparente muerte de Hopper, se muda de Hawkins con la familia Byers, prometiendo mantenerse en contacto por radio.",
  ),

  // 2. Eleven (Once)
  const StrangerCharacter(
    firstName: 'Eleven',
    lastName: '(Jane Hopper)',
    gridImageUrl: 'Eleven.webp',
    shortDescription: 'Sujeto de prueba con poderes telequinéticos. Cerró el portal.',
    isAliveInSeason3: true,
    hasPowers: true, // Marcamos true aunque los pierda al final de T3, es su rasgo principal.
    longBio: "Nacida como Jane Ives y secuestrada al nacer por el Dr. Martin Brenner, fue criada en el Laboratorio Nacional de Hawkins como el sujeto de prueba '011'. Sometida a experimentos brutales para potenciar sus habilidades de telequinesis y percepción remota, abrió accidentalmente la primera puerta al Upside Down. Tras escapar en 1983, fue acogida por Mike y sus amigos, aprendiendo sobre la amistad y el mundo exterior mientras los defendía de los agentes del gobierno y del Demogorgon.\n\n"
        "Después de ser dada por muerta, sobrevivió sola en el bosque hasta ser encontrada por Jim Hopper, quien la mantuvo escondida en una cabaña secreta durante casi un año por su seguridad. Esta reclusión provocó una crisis de identidad que la llevó a buscar a su madre biológica y a su 'hermana' perdida, Kali (008). Sin embargo, regresó a Hawkins para salvar a sus amigos y demostró un poder inmenso al cerrar sola la gigantesca Puerta interdimensional bajo el laboratorio. Posteriormente, fue adoptada legalmente por Hopper.\n\n"
        "En el verano de 1985, Eleven intenta llevar una vida adolescente normal, disfrutando de su noviazgo con Mike y su nueva amistad con Max en el centro comercial Starcourt. Sus poderes le alertan del regreso del Mind Flayer, que posee a Billy Hargrove. En la batalla final en Starcourt Mall, Eleven es herida en la pierna por el monstruo, y en el esfuerzo final para detener a Billy y al Desollamentes, agota completamente sus baterías psíquicas, perdiendo sus poderes. Tras la aparente muerte de Hopper, una Eleven vulnerable y sin habilidades se muda de Hawkins con la familia Byers para empezar de nuevo.",
  ),

  // 3. Will Byers
  const StrangerCharacter(
    firstName: 'Will',
    lastName: 'Byers',
    gridImageUrl: 'Will.webp',
    shortDescription: 'El niño que sobrevivió al Upside Down y a la posesión.',
    isAliveInSeason3: true,
    hasPowers: false, // Tenía "visión verdadera" residual en T2/T3, pero no poderes activos.
    longBio: "Will Byers es un chico sensible, artístico y amable cuya desaparición en noviembre de 1983 inició los extraños eventos en Hawkins. Secuestrado por el Demogorgon, sobrevivió milagrosamente durante una semana atrapado en la dimensión tóxica y fría del Upside Down, escondiéndose en la versión oscura de su propia casa y comunicándose a través de las luces navideñas con su madre, Joyce. Fue rescatado justo a tiempo por Joyce y Hopper, pero la experiencia lo dejó marcado para siempre.\n\n"
        "Un año después de su rescate, Will comenzó a tener episodios de 'visión verdadera', viendo el Upside Down superpuesto a la realidad. Pronto se reveló que no eran flashbacks, sino que estaba siendo infectado lentamente por el Mind Flayer, una entidad sombría gigante. El monstruo finalmente poseyó su cuerpo por completo, usándolo como espía. Will luchó internamente, usando código morse para decir a sus amigos cómo cerrar el portal, antes de ser liberado de la posesión mediante un exorcismo de calor extremo.\n\n"
        "En el verano de 1985, Will es el único del grupo que lucha por aceptar que están creciendo y dejando atrás los juegos infantiles como D&D. Se siente aislado mientras sus amigos se centran en sus novias. Sin embargo, mantiene una conexión residual con el Mind Flayer, sintiendo un escalofrío en la nuca cada vez que la entidad está activa o cerca. Esta habilidad sirve como sistema de alerta temprana para el grupo. Al final de la temporada, tras tanto trauma en Hawkins, se muda con su madre y hermano, y con Eleven, fuera del pueblo.",
  ),

  // 4. Lucas Sinclair
  const StrangerCharacter(
    firstName: 'Lucas',
    lastName: 'Sinclair',
    gridImageUrl: 'Lucas.webp',
    shortDescription: 'El "Ranger" del grupo, pragmático y valiente. Novio de Max.',
    isAliveInSeason3: true,
    hasPowers: false,
    longBio: "Lucas Sinclair es el miembro más pragmático, escéptico y realista del grupo principal. En 1983, fue el más cauteloso a la hora de confiar en Eleven, temiendo que fuera peligrosa o una espía del laboratorio. Esta desconfianza causó una fractura temporal con Mike, pero Lucas demostró su lealtad inquebrantable al realizar su propia misión de reconocimiento en el laboratorio, advirtiendo a sus amigos de la llegada de los agentes del gobierno. Su arma preferida, el tirachinas 'Wrist Rocket', ha sido crucial en varios enfrentamientos.\n\n"
        "En 1984, Lucas se interesó inmediatamente por la nueva chica de California, Max Mayfield. A pesar de la hostilidad del hermanastro de ella, Billy, Lucas persistió en invitarla al grupo. Fue él quien tomó la difícil decisión de revelarle a Max toda la verdad sobre los eventos sobrenaturales de Hawkins para ganarse su confianza, a pesar de las reglas del grupo. Su relación floreció, y juntos ayudaron a incendiar los túneles del Upside Down para distraer a los 'Demodogs'.\n\n"
        "Durante el verano de 1985, su relación con Max atraviesa altibajos típicos de la adolescencia, con Lucas pidiendo consejos de citas cuestionables a Mike. Sin embargo, cuando el peligro regresa, Lucas demuestra su valentía una vez más, protegiendo a sus amigos en la batalla del Starcourt Mall. Juega un papel crucial con su tirachinas mejorado y ayudando a organizar la defensa contra el Mind Flayer físico. Termina la temporada consolando a una devastada Max tras la muerte de Billy.",
  ),

  // 5. Dustin Henderson
  const StrangerCharacter(
    firstName: 'Dustin',
    lastName: 'Henderson',
    gridImageUrl: 'Dustin.webp',
    shortDescription: 'El genio científico y diplomático del grupo. "Cerebro".',
    isAliveInSeason3: true,
    hasPowers: false,
    longBio: "Dustin Henderson es el corazón cómico y el cerebro científico del grupo. Con una curiosidad insaciable y un optimismo inquebrantable a pesar de su displasia cleidocraneal, Dustin a menudo actúa como mediador en los conflictos entre Mike y Lucas. En la primera temporada, su pensamiento lógico y su brújula moral fueron esenciales para mantener al grupo unido mientras buscaban a Will y protegían a Eleven.\n\n"
        "En 1984, su amor por la ciencia lo metió en problemas cuando encontró una criatura similar a un renacuajo del Upside Down en su basura. Creyendo que había descubierto una nueva especie, la adoptó y la llamó 'Dart'. Su error casi resulta fatal cuando Dart creció hasta convertirse en un Demodog y mató a su gato, Mews. Dustin tuvo que asumir la responsabilidad, aliándose improbablemente con Steve Harrington para cazar a la criatura, forjando una de las mejores amistades de la serie. Steve se convirtió en su mentor y figura fraterna.\n\n"
        "Al regresar del campamento científico 'Know Where' en el verano de 1985, Dustin se siente inicialmente ignorado por sus amigos. Sin embargo, intercepta accidentalmente una transmisión rusa secreta con su gigantesca torre de radio casera, 'Cerebro'. Al no ser tomado en serio por el grupo principal, forma el 'Scoops Troop' con Steve, Robin Buckley y su propia hermana pequeña, Erica. Este equipo se infiltra en la base rusa subterránea bajo el centro comercial Starcourt, siendo fundamentales para descubrir el plan soviético para reabrir el portal.",
  ),

  // 6. Max Mayfield
  const StrangerCharacter(
    firstName: 'Max',
    lastName: 'Mayfield',
    gridImageUrl: 'Max.webp',
    shortDescription: 'La chica nueva de California, skater y "Zoomer". Novia de Lucas.',
    isAliveInSeason3: true,
    hasPowers: false,
    longBio: "Maxine 'Max' Mayfield llegó a Hawkins desde California en 1984, arrastrada por el divorcio de su madre y su nuevo matrimonio con el padre de Billy Hargrove. Skater experta y campeona de videojuegos arcade bajo el alias 'MADMAX', inicialmente se mostró cerrada y desconfiada debido al constante abuso y control de su hermanastro Billy. Aunque Lucas y Dustin intentaron integrarla en el grupo, Mike fue hostil al principio. Finalmente, tras descubrir la verdad sobre el Upside Down y enfrentarse valientemente a Billy, se ganó su lugar en el grupo y comenzó una relación con Lucas.\n\n"
        "En el verano de 1985, Max desarrolla una estrecha amistad con Eleven, ayudándola a descubrir su propia identidad fuera de Mike y Hopper, llevándola de compras al Starcourt Mall y enseñándole a divertirse. Max se convierte en una influencia crucial para la independencia de Eleven. Sin embargo, su verano se oscurece cuando sospecha que su hermanastro Billy está involucrado en algo peligroso.\n\n"
        "Sus peores temores se confirman cuando descubre que Billy ha sido poseído por el Mind Flayer y está siendo utilizado para crear un ejército. Durante la batalla final en el centro comercial, Max presencia con horror cómo Billy, en un momento de lucidez, se sacrifica para salvar a Eleven del monstruo. La temporada termina con Max traumatizada y de luto por la muerte de su complejo hermanastro, sentada en su habitación vacía tras la mudanza de los Byers y Eleven.",
  ),

  // 7. Jim Hopper
  const StrangerCharacter(
    firstName: 'Jim',
    lastName: 'Hopper',
    gridImageUrl: 'Hopper.webp',
    shortDescription: 'Jefe de policía de Hawkins y padre adoptivo protector de Eleven.',
    isAliveInSeason3: true, // Presumido muerto en Hawkins, pero vivo en Rusia.
    hasPowers: false,
    longBio: "Jim Hopper comenzó como el cínico y alcohólico jefe de policía de Hawkins, atormentado por la muerte de su hija pequeña, Sara, por cáncer. La desaparición de Will Byers lo sacó de su estupor. Su investigación implacable destapó la conspiración del Laboratorio de Hawkins y la existencia del Upside Down. Su determinación lo llevó a infiltrarse en el laboratorio y hacer un trato desesperado para salvar a Will, lo que implicó revelar la ubicación de Eleven.\n\n"
        "En la segunda temporada, Hopper encuentra a Eleven viva en el bosque y la esconde en una cabaña, convirtiéndose en una figura paterna ferozmente protectora, aunque estricta. Su arco se centra en aprender a ser padre de nuevo mientras lucha físicamente contra los túneles del Upside Down que infectan Hawkins. Su relación con Joyce Byers se profundiza, pasando de una vieja amistad a una tensión romántica palpable mientras trabajan juntos para salvar a sus hijos.\n\n"
        "Durante la tercera temporada, Hopper lucha con los desafíos de criar a una Eleven adolescente y su noviazgo con Mike, a menudo reaccionando con celos y un enojo explosivo. Su investigación sobre unos imanes misteriosos lo lleva, junto a Joyce y Murray Bauman, a descubrir una base rusa secreta bajo el Starcourt Mall. En el clímax, Hopper se sacrifica aparentemente para permitir que Joyce cierre el portal, quedando atrapado en la zona de explosión de la máquina rusa. Aunque Hawkins lo llora como un héroe caído, sobrevive y es capturado por los soviéticos.",
  ),

  // 8. Joyce Byers
  const StrangerCharacter(
    firstName: 'Joyce',
    lastName: 'Byers',
    gridImageUrl: 'Joyce.webp',
    shortDescription: 'Madre feroz y decidida de Will y Jonathan. Nunca se rinde.',
    isAliveInSeason3: true,
    hasPowers: false,
    longBio: "Joyce Byers es la definición de una madre coraje. Trabajadora de clase trabajadora y madre soltera, su mundo se derrumbó con la desaparición de su hijo menor, Will, en 1983. A pesar de ser considerada histérica y loca por casi todo el pueblo, Joyce se negó a creer que Will estaba muerto, especialmente después de comunicarse con él a través de las luces de Navidad en su pared. Su fe inquebrantable y su negativa a rendirse fueron la fuerza motriz que llevó al eventual rescate de Will del Upside Down.\n\n"
        "Un año después, Joyce se muestra sobreprotectora con Will, quien sufre de TEPT. Comienza una relación con el amable Bob Newby, que trae una breve estabilidad a su vida. Sin embargo, cuando Will es poseído por el Mind Flayer, Joyce toma medidas drásticas, drogando a su propio hijo para interrogar al monstruo y luego sometiéndolo a un calor extremo para expulsar a la entidad, presenciando trágicamente la muerte de Bob en el proceso.\n\n"
        "En 1985, Joyce sigue preocupada por la seguridad de su familia y planea mudarse de Hawkins. Su curiosidad se despierta cuando los imanes de su nevera dejan de funcionar, lo que la lleva a arrastrar a Hopper a una investigación que descubre la conspiración rusa en el Starcourt Mall. En la batalla final en la base subterránea, Joyce se ve obligada a tomar la devastadora decisión de girar las llaves para cerrar el portal, sabiendo que la explosión resultante aparentemente matará a Hopper. Con el corazón roto y buscando seguridad, finalmente se muda de Hawkins con Will, Jonathan y Eleven.",
  ),

  // 9. Karen Wheeler
  const StrangerCharacter(
    firstName: 'Karen',
    lastName: 'Wheeler',
    gridImageUrl: 'karen.webp',
    shortDescription: 'Madre de Mike y Nancy. Ama de casa suburbana.',
    isAliveInSeason3: true,
    hasPowers: false,
    longBio: "Karen Wheeler parece ser la típica ama de casa suburbana de los años 80, viviendo una vida cómoda pero insatisfactoria con su marido adicto al trabajo, Ted. A menudo está ajena a las peligrosas aventuras en las que se embarcan sus hijos, Mike y Nancy, aunque intenta sinceramente conectar con ellos y ofrecerles apoyo maternal cuando nota que algo anda mal. En la primera temporada, se preocupa por el comportamiento retraído de Mike tras la desaparición de Will y la distancia creciente de Nancy.\n\n"
        "Su papel se expande ligeramente en temporadas posteriores, mostrando su creciente insatisfacción con su matrimonio monótono. En la segunda temporada, desarrolla una atracción por el chico malo Billy Hargrove, lo que culmina en la tercera temporada cuando casi tiene una aventura con él. Mientras se prepara para encontrarse con Billy en un motel, ve a su hija pequeña Holly dormida y tiene un momento de claridad moral, decidiendo no seguir adelante con la infidelidad.\n\n"
        "Esta decisión salva indirectamente su vida, ya que Billy es poseído por el Mind Flayer esa misma noche mientras conducía hacia ella. Karen pasa el resto de la tercera temporada en gran parte inconsciente del caos sobrenatural que ocurre en el centro comercial, preocupada por el ambiente tenso en la feria del 4 de julio, pero finalmente reconecta con su esposo Ted en la noria.",
  ),

  // 10. Bob Newby
  const StrangerCharacter(
    firstName: 'Bob',
    lastName: 'Newby',
    gridImageUrl: 'Bob.webp',
    shortDescription: 'El novio amable y cerebrito de Joyce. "Bob el superhéroe".',
    isAliveInSeason3: false, // Falleció en la T2.
    hasPowers: false,
    longBio: "Bob Newby fue un personaje recurrente en la segunda temporada. Un antiguo compañero de clase de Joyce y Hopper en el instituto, Bob dirigía la tienda local de RadioShack. Era un hombre increíblemente amable, genuino, optimista y un autoproclamado nerd, que amaba los rompecabezas y la tecnología. Comenzó una relación con Joyce Byers, trayendo una muy necesaria luz y normalidad a su caótica vida y tratando de ser una figura paterna positiva para Will y Jonathan, a pesar de no entender completamente el trauma de Will.\n\n"
        "Aunque inicialmente ajeno a los horrores de Hawkins, Bob aceptó la verdad sin dudarlo cuando la situación con Will empeoró. Su inteligencia y habilidades informáticas fueron cruciales cuando el grupo quedó atrapado en el Laboratorio de Hawkins, rodeado por Demodogs. Bob se ofreció como voluntario para una misión suicida: bajar al sótano para restablecer la energía y desbloquear las puertas, permitiendo que los demás escaparan.\n\n"
        "Bob logró su misión heroicamente, ganándose el apodo de 'Bob el Superhéroe'. Sin embargo, en una de las escenas más trágicas de la serie, fue atacado y brutalmente asesinado por los Demodogs justo delante de Joyce cuando estaban a punto de salir del edificio. Su muerte dejó una profunda cicatriz en Joyce y el grupo, recordado como un verdadero héroe que dio su vida por los demás.",
  ),

  // 11. Nancy Wheeler
  const StrangerCharacter(
    firstName: 'Nancy',
    lastName: 'Wheeler',
    gridImageUrl: 'Nancy.webp',
    shortDescription: 'Hermana mayor de Mike. Aspirante a periodista y luchadora.',
    isAliveInSeason3: true,
    hasPowers: false,
    longBio: "Nancy Wheeler comienza como una adolescente estudiosa preocupada por los chicos y la popularidad, pero la desaparición de su mejor amiga Barb Holland en 1983 la transforma en una investigadora tenaz y una luchadora formidable. Dejando de lado su imagen de 'niña buena', se une a Jonathan Byers para cazar al Demogorgon que se llevó a Barb, demostrando un coraje increíble y una habilidad natural con las armas de fuego. Su relación con Steve Harrington se deteriora, y finalmente comienza un romance con Jonathan.\n\n"
        "En la segunda temporada, Nancy está consumida por la culpa por la muerte de Barb y la tapadera del gobierno. Junto con Jonathan, orquesta un plan para exponer al Laboratorio de Hawkins, grabando una confesión del Dr. Owens y llevándola al investigador paranoico Murray Bauman, lo que finalmente lleva al cierre del laboratorio. Su relación con Jonathan se solidifica durante esta misión.\n\n"
        "En el verano de 1985, Nancy trabaja como becaria en el periódico local, 'The Hawkins Post', donde lucha contra el sexismo flagrante de sus jefes masculinos que solo la ven como la chica de los recados. Decidida a probar su valía, investiga por su cuenta la extraña conducta de las ratas en la ciudad, lo que la lleva a descubrir la existencia de los 'Desollados' y el regreso del Mind Flayer. Su investigación es clave para unir los diferentes hilos de la trama de la tercera temporada. Al final, comparte una despedida llorosa con Jonathan cuando él se muda.",
  ),

  // 12. Robin Buckley
  const StrangerCharacter(
    firstName: 'Robin',
    lastName: 'Buckley',
    gridImageUrl: 'Robin.webp',
    shortDescription: 'Compañera de trabajo de Steve en Scoops Ahoy. Inteligente y sarcástica.',
    isAliveInSeason3: true,
    hasPowers: false,
    longBio: "Robin Buckley se introduce en la tercera temporada como la compañera de trabajo sarcástica y alternativa de Steve Harrington en la heladería 'Scoops Ahoy' del Starcourt Mall. Inicialmente, disfruta burlándose de los intentos fallidos de Steve por ligar con chicas y de su caída en la escala social del instituto. Sin embargo, es increíblemente inteligente y tiene un talento natural para los idiomas y los códigos.\n\n"
        "Cuando Dustin intercepta una transmisión rusa secreta, Robin es quien logra descifrar el código, revelando que hay agentes soviéticos operando en el centro comercial. Ella se une a Steve, Dustin y Erica para formar el 'Scoops Troop', infiltrándose valientemente en la base subterránea rusa. Durante la misión, ella y Steve son capturados e interrogados por los rusos bajo la influencia de un suero de la verdad.\n\n"
        "En una escena emotiva en el baño de un cine, mientras aún están drogados, Steve confiesa sus sentimientos por ella, pero Robin valientemente sale del armario como lesbiana, revelando que su obsesión con él en el instituto no era romántica, sino celos porque la chica que le gustaba miraba a Steve. Steve acepta esto inmediatamente, y su relación se transforma en una profunda y platónica amistad. Al final de la temporada, ambos consiguen trabajo en el videoclub local.",
  ),

  // 13. Erica Sinclair
  const StrangerCharacter(
    firstName: 'Erica',
    lastName: 'Sinclair',
    gridImageUrl: 'Erica.webp',
    shortDescription: 'Hermana pequeña de Lucas. Descarada, capitalista y nerd secreta.',
    isAliveInSeason3: true,
    hasPowers: false,
    longBio: "Erica Sinclair es la hermana menor de Lucas, conocida por su actitud descarada, su agudo ingenio y su desdén por las actividades 'nerd' de su hermano y sus amigos, a quienes llama constantemente 'pringados'. En las primeras temporadas, su papel es principalmente cómico, molestando a Lucas y disfrutando de la frustración que le causa. Tiene un fuerte sentido del negocio y no hace nada gratis.\n\n"
        "En la tercera temporada, su papel se expande significativamente. Su amor por el helado gratis en Scoops Ahoy la lleva a ser reclutada a regañadientes por Dustin, Steve y Robin para una misión peligrosa. Debido a su pequeño tamaño, es la única que puede colarse a través de los conductos de ventilación para llegar al ascensor secreto ruso en el centro comercial. Ella acepta solo a cambio de helado gratis de por vida.\n\n"
        "Erica demuestra ser increíblemente valiente y capaz bajo presión durante la infiltración en la base rusa, calculando rutas y ayudando a rescatar a Steve y Robin. A pesar de su exterior duro, Dustin señala que sus habilidades matemáticas y su valentía la convierten en una 'nerd' también, un título que ella rechaza vehementemente, prefiriendo el término 'capitalista'. Su participación es crucial para el éxito del 'Scoops Troop'.",
  ),

  // 14. Steve Harrington
  const StrangerCharacter(
    firstName: 'Steve',
    lastName: 'Harrington',
    gridImageUrl: 'Steve.webp',
    shortDescription: 'El ex "Rey" del instituto convertido en niñera heroica.',
    isAliveInSeason3: true,
    hasPowers: false,
    longBio: "Steve Harrington tiene uno de los arcos de redención más notables de la serie. Comenzó como el típico chico popular, arrogante y novio de Nancy Wheeler en 1983. Inicialmente antagonista hacia Jonathan Byers, Steve demostró tener conciencia cuando rompió con sus amigos tóxicos y salvó a Nancy y Jonathan del Demogorgon con un bate de béisbol con clavos, que se convertiría en su arma insignia.\n\n"
        "En la segunda temporada, después de que Nancy rompiera con él, Steve encontró un nuevo propósito improbable como protector de los niños más jóvenes, especialmente forjando una estrecha amistad de mentor con Dustin. Se convirtió en la 'niñera' del grupo, arriesgando repetidamente su vida para luchar contra los Demodogs y proteger a los chicos en el depósito de chatarra y en los túneles subterráneos. Aceptó con gracia que Nancy amaba a Jonathan y siguió adelante.\n\n"
        "En el verano de 1985, Steve trabaja en un empleo sin futuro en la heladería Scoops Ahoy, lidiando con la pérdida de su estatus social. Se une a Dustin, Robin y Erica para descubrir la base rusa secreta bajo el centro comercial. A pesar de ser capturado y torturado, protege a Robin y demuestra una valentía inmensa. Su amistad con Robin se profundiza cuando ella sale del armario ante él y él la acepta sin dudarlo. Al final, consigue un nuevo trabajo en el videoclub con Robin, habiendo madurado en un héroe genuinamente bueno y desinteresado.",
  ),

  // 15. Jonathan Byers
  const StrangerCharacter(
    firstName: 'Jonathan',
    lastName: 'Byers',
    gridImageUrl: 'Jonathan.webp',
    shortDescription: 'Hermano mayor de Will. Fotógrafo introvertido y protector.',
    isAliveInSeason3: true,
    hasPowers: false,
    longBio: "Jonathan Byers es el hermano mayor introvertido y artístico de Will. Es ferozmente protector con su familia y un talentoso fotógrafo, aunque socialmente torpe. La desaparición de Will en 1983 lo empujó a una alianza improbable con Nancy Wheeler. Juntos, investigaron por su cuenta, descubriendo la existencia del Demogorgon y prepararon trampas para cazarlo en la casa de los Byers. Su conexión con Nancy creció, a pesar de que ella estaba saliendo con Steve en ese momento.\n\n"
        "En la segunda temporada, Jonathan ayuda a Nancy en su cruzada para obtener justicia para Barb. Viajan juntos para encontrarse con Murray Bauman, donde la tensión romántica entre ellos finalmente se resuelve y comienzan una relación. Son fundamentales para exponer los secretos del Laboratorio de Hawkins al público, lo que lleva a su cierre.\n\n"
        "En el verano de 1985, Jonathan trabaja como becario de fotografía en 'The Hawkins Post' junto a Nancy. A menudo se encuentra atrapado entre apoyar la búsqueda de la verdad de Nancy y su necesidad de mantener el trabajo para ayudar económicamente a su familia. Finalmente, se une a Nancy en la investigación de los 'Desollados', luchando valientemente contra los poseídos en el hospital y en el centro comercial. Al final de la temporada, se muda de Hawkins con su madre y su hermano, compartiendo una emotiva despedida con Nancy.",
  ),

  // 16. Kali Prasad (008)
  const StrangerCharacter(
    firstName: 'Kali',
    lastName: 'Prasad (008)',
    gridImageUrl: 'Kali.webp',
    shortDescription: 'Sujeto de prueba 008. "Hermana" de Eleven con poderes de ilusión.',
    isAliveInSeason3: true, // Su estado es desconocido, pero la última vez que se vio estaba viva huyendo de la policía.
    hasPowers: true,
    longBio: "Kali Prasad, también conocida como 008, es otro sujeto de prueba del Laboratorio Nacional de Hawkins y considerada una 'hermana' mayor por Eleven. Fue secuestrada joven de su hogar en Londres. A diferencia de los poderes telequinéticos de Eleven, Kali tiene la capacidad de manipular la mente de las personas para crear alucinaciones visuales y auditivas hiperrealistas, pudiendo hacerse invisible a sí misma y a otros, o hacer que la gente vea cosas aterradoras.\n\n"
        "Kali logró escapar del laboratorio años antes que Eleven y formó una banda de marginados y criminales en Chicago. Vive una vida de venganza justiciera, rastreando y asesinando a los exempleados del laboratorio que la torturaron a ella y a otros niños. En la segunda temporada, Eleven la localiza y pasa un tiempo con su banda.\n\n"
        "Kali intenta enseñar a Eleven a canalizar su ira para fortalecer sus poderes y la anima a unirse a su misión de venganza. Sin embargo, sus métodos violentos chocan con la moralidad de Eleven. Cuando Eleven decide que su lugar está salvando a sus amigos en Hawkins en lugar de buscando venganza, abandona a Kali. La última vez que se vio a Kali, estaba huyendo de la policía en Chicago con su banda; su paradero en la tercera temporada es desconocido, pero sigue viva.",
  ),

  // 17. Billy Hargrove
  const StrangerCharacter(
    firstName: 'Billy',
    lastName: 'Hargrove',
    gridImageUrl: 'Billy.webp',
    shortDescription: 'Hermanastro abusivo de Max. Poseído por el Mind Flayer.',
    isAliveInSeason3: false, // Muere al final de T3.
    hasPowers: false, // Tuvo fuerza sobrehumana mientras estaba poseído, pero no son suyos.
    longBio: "William 'Billy' Hargrove llegó a Hawkins en 1984 desde California, trayendo una actitud agresiva y volátil, resultado del abuso físico y emocional de su padre. Rápidamente se convirtió en el matón de la escuela y en una fuerza antagonista para el grupo principal, especialmente abusivo y controlador con su hermanastro Max y hostil hacia Lucas y Steve.\n\n"
        "En el verano de 1985, Billy trabaja como salvavidas en la piscina comunitaria. Una noche, de camino a un encuentro ilícito con Karen Wheeler, es atacado cerca de la acería abandonada y se convierte en el primer huésped humano ('El Desollado') del Mind Flayer en su nueva incursión. El monstruo utiliza el cuerpo de Billy para secuestrar a otros residentes y construir un ejército físico de carne derretida para el Desollamentes.\n\n"
        "Durante la tercera temporada, actúa como el general de campo del monstruo, persiguiendo implacablemente a Eleven, la principal amenaza para la entidad. En el enfrentamiento final en el Starcourt Mall, Eleven accede a un recuerdo feliz de su infancia con su madre en la playa, rompiendo temporalmente el control mental. En un acto final de redención, Billy se sacrifica interponiéndose entre el monstruo gigante y Eleven, salvándole la vida antes de morir por múltiples heridas delante de Max.",
  ),

  // 18. Murray Bauman
  const StrangerCharacter(
    firstName: 'Murray',
    lastName: 'Bauman',
    gridImageUrl: 'Murray.webp',
    shortDescription: 'Periodista de investigación excéntrico y teórico de la conspiración.',
    isAliveInSeason3: true,
    hasPowers: false,
    longBio: "Murray Bauman es un ex periodista de investigación convertido en teórico de la conspiración paranoico que vive en un búnker aislado lleno de vodka y equipos de vigilancia. Inicialmente contratado por los padres de Barb Holland para investigar su desaparición, Murray estaba convencido de una conspiración rusa mucho antes de que fuera verdad. Es excéntrico, abrasivo y socialmente directo, pero tiene una mente brillante para conectar puntos que otros ignoran.\n\n"
        "En la segunda temporada, Nancy y Jonathan buscan su ayuda para exponer al Laboratorio de Hawkins. Murray los ayuda a diluir la verdad sobre el Upside Down en una historia más creíble sobre fugas químicas, lo que logra cerrar el laboratorio. También actúa como un improbable consejero matrimonial, empujando a Nancy y Jonathan a admitir sus sentimientos mutuos.\n\n"
        "En la tercera temporada, Hopper y Joyce acuden a él con un científico ruso secuestrado, Alexei. Murray, que habla ruso fluido, se convierte en su traductor y aliado indispensable. Desarrolla una extraña amistad con Alexei mientras se infiltran en la feria del 4 de julio y luego en la base rusa subterránea. Murray es crucial para navegar por las instalaciones y ayuda a Joyce y Hopper a llegar a la sala de control para cerrar el portal.",
  ),

  // 19. Sam Owens
  const StrangerCharacter(
    firstName: 'Sam',
    lastName: 'Owens',
    gridImageUrl: 'Sam.webp',
    shortDescription: 'Científico de alto rango que reemplazó a Brenner en el laboratorio.',
    isAliveInSeason3: true,
    hasPowers: false,
    longBio: "El Dr. Sam Owens fue enviado por el Departamento de Energía para limpiar el desastre dejado por el Dr. Brenner en el Laboratorio Nacional de Hawkins después de la primera temporada. A diferencia de su predecesor sociópata, Owens es un hombre más pragmático y, en cierta medida, empático, cuyo objetivo principal es contener la amenaza del Upside Down y mantener el secreto del gobierno, pero tratando de minimizar el daño civil adicional.\n\n"
        "Se hace cargo del tratamiento médico de Will Byers, monitorizando sus episodios y tratando de entender su conexión con el Mind Flayer. Aunque inicialmente parece otro burócrata del gobierno en quien no se puede confiar, Owens demuestra su valía cuando el laboratorio es invadido por Demodogs. Él guía a Hopper, Joyce y los niños hacia la seguridad a través de las cámaras de vigilancia y se queda atrás para darles tiempo, sobreviviendo milagrosamente al ataque.\n\n"
        "Al final de la segunda temporada, como favor a Hopper por su ayuda, Owens utiliza sus conexiones gubernamentales para falsificar un certificado de nacimiento para Eleven, nombrándola legalmente 'Jane Hopper' y permitiéndole una oportunidad de tener una vida normal. Su paradero durante la mayor parte de la tercera temporada es desconocido, pero al final, es él quien llega con el ejército de EE. UU. para limpiar la base rusa en el Starcourt Mall después de que se cerrara el portal.",
  ),

  // 20. Martin Brenner
  const StrangerCharacter(
    firstName: 'Martin',
    lastName: 'Brenner',
    gridImageUrl: 'Brenner.webp',
    shortDescription: 'El director original del laboratorio. "Papa" de Eleven.',
    isAliveInSeason3: true, // Se confirmó que sobrevivió al ataque de S1, aunque no aparece en S3.
    hasPowers: false,
    longBio: "El Dr. Martin Brenner es el frío y calculador científico principal que dirigió el Laboratorio Nacional de Hawkins y los experimentos del Proyecto MKUltra. Es la figura paterna manipuladora de Eleven, a quien ella llamaba 'Papa'. Brenner secuestró a Eleven al nacer de su madre, Terry Ives, y la sometió a años de aislamiento y pruebas rigurosas y a menudo crueles para desarrollar y controlar sus habilidades psíquicas, usándola para espiar a los soviéticos y finalmente haciendo contacto con el Upside Down.\n\n"
        "Su obsesión por controlar a Eleven y explorar la otra dimensión condujo directamente a la apertura del portal y a la liberación del Demogorgon en Hawkins. Durante el clímax de la primera temporada, Brenner y sus agentes confrontaron a Eleven en la escuela secundaria. Fue atacado directamente por el Demogorgon y se le dio por muerto.\n\n"
        "Sin embargo, en la segunda temporada, un exempleado del laboratorio le revela a Eleven y Kali que Brenner sobrevivió al ataque y que todavía está vivo, escondido en algún lugar. Eleven tiene visiones de él, atormentándola. Aunque no aparece físicamente en la tercera temporada, su sombra sigue presente en el trauma de Eleven y en la existencia continua de la amenaza del Upside Down. Sigue vivo y activo en las sombras.",
  ),

  // 21. Barbara Holland
  const StrangerCharacter(
    firstName: 'Barbara',
    lastName: 'Holland',
    gridImageUrl: 'Barbara.webp',
    shortDescription: 'La mejor amiga leal de Nancy. Primera víctima importante del Demogorgon.',
    isAliveInSeason3: false, // Murió en la T1.
    hasPowers: false,
    longBio: "Barbara 'Barb' Holland era la mejor amiga sensata, leal y algo conservadora de Nancy Wheeler. Era la voz de la razón que intentaba mantener a Nancy con los pies en la tierra mientras esta comenzaba a salir con el popular Steve Harrington. Barb estaba preocupada de que Nancy estuviera cambiando su personalidad para encajar con el grupo popular y abandonando su verdadera identidad.\n\n"
        "Trágicamente, durante una fiesta en casa de Steve en 1983, mientras estaba sentada sola junto a la piscina con una herida en la mano sangrando, el olor a sangre atrajo al Demogorgon. Fue arrastrada al Upside Down. Desorientada y aterrorizada en la dimensión oscura, intentó escapar de la piscina vacía, pero fue rápidamente capturada y asesinada por la criatura, sirviendo como incubadora para las larvas de Demogorgon.\n\n"
        "Su desaparición fue inicialmente encubierta por el gobierno como una fuga adolescente, lo que causó una inmensa angustia a sus padres y culpa a Nancy. Su muerte se convirtió en un punto de la trama importante en la segunda temporada, impulsando la cruzada de Nancy y Jonathan para exponer al laboratorio. Finalmente, gracias a Murray Bauman, se dio una historia pública falsa sobre su muerte por exposición a toxinas químicas, dándole a sus padres cierto cierre y justicia póstuma.",
  ),

  // 22. Eddie Munson (Técnicamente no aparece en T3, pero está vivo en Hawkins)
  const StrangerCharacter(
    firstName: 'Eddie',
    lastName: 'Munson',
    gridImageUrl: 'Eddie.webp',
    shortDescription: 'Líder del Hellfire Club y guitarrista de metal. Futuro héroe.',
    isAliveInSeason3: true, // Vivo en Hawkins, aunque no introducido aún.
    hasPowers: false,
    longBio: "*Nota: Este personaje se introduce prominentemente en la Temporada 4, pero durante los eventos de la Temporada 3, residía en Hawkins.*\n\n"
        "Eddie Munson es un estudiante repetidor en la Escuela Secundaria Hawkins y el carismático y excéntrico líder del 'Hellfire Club', el club oficial de Dungeons & Dragons de la escuela. Es un marginado social orgulloso, amante del heavy metal, que desprecia la conformidad de la vida en el pequeño pueblo y las camarillas populares de la escuela. Vive en el parque de caravanas con su tío Wayne.\n\n"
        "Durante el verano de 1985 (Temporada 3), mientras el Starcourt Mall estaba en auge y los eventos con el Mind Flayer se desarrollaban, Eddie habría estado en Hawkins, probablemente lidiando con sus propios problemas de adolescente marginado, tocando la guitarra y preparándose para otro año escolar, completamente ajeno a las batallas sobrenaturales que sus futuros amigos (Mike, Dustin, Lucas) estaban librando cerca. Su destino heroico y trágico aún estaba por llegar un año después con la llegada de Vecna.",
  ),

  // 23. Argyle (Técnicamente no aparece en T3, pero está vivo en California)
  const StrangerCharacter(
    firstName: 'Argyle',
    lastName: '', // No se conoce apellido
    gridImageUrl: 'Argyle.webp',
    shortDescription: 'Repartidor de pizza stoner de California y nuevo amigo de Jonathan.',
    isAliveInSeason3: true, // Vivo en California.
    hasPowers: false,
    longBio: "*Nota: Este personaje se introduce en la Temporada 4 como el nuevo mejor amigo de Jonathan en California.*\n\n"
        "Argyle es un adolescente relajado, de pelo largo y perpetuamente drogado que vive en Lenora Hills, California. Trabaja como repartidor para 'Surfer Boy Pizza', conduciendo su colorida furgoneta VW. Es la definición de un 'stoner' de los años 80: despreocupado, amable, filosófico a su manera y rara vez estresado por nada.\n\n"
        "Durante el verano de 1985 (Temporada 3), Argyle habría estado viviendo su vida en California, entregando pizzas y fumando hierba, completamente desconectado de los horrores que ocurrían en Hawkins, Indiana. Se convertirá en una parte crucial del grupo un año después, cuando la familia Byers se mude a su ciudad y él se convierta en el único amigo de Jonathan y, accidentalmente, en el conductor de huida para Mike, Will y Jonathan mientras intentan encontrar a Eleven y escapar del ejército de los EE. UU., aportando un alivio cómico muy necesario a situaciones tensas.",
  ),

  // 24. Vecna (Henry Creel / 001)
  const StrangerCharacter(
    firstName: 'Vecna',
    lastName: '(Henry Creel / 001)',
    gridImageUrl: 'Vecna.webp',
    shortDescription: 'El villano principal del Upside Down. El primer sujeto de prueba.',
    isAliveInSeason3: true, // Activo en el Upside Down, controlando al Mind Flayer.
    hasPowers: true,
    longBio: "Vecna, originalmente nacido como Henry Creel en la década de 1950, fue un niño perturbado que descubrió que tenía habilidades psicoquinéticas. Usó sus poderes para torturar animales y finalmente asesinar a su madre y a su hermana, incriminando a su padre, Victor Creel. Henry colapsó por el esfuerzo y fue tomado por el Dr. Martin Brenner, convirtiéndose en el sujeto de prueba '001' en el Laboratorio de Hawkins. Brenner intentó controlar sus poderes, pero al no poder, le implantó un dispositivo 'Soteria' para suprimirlos y lo convirtió en un ordenanza en el laboratorio.\n\n"
        "En 1979, un joven Henry manipuló a Eleven para que le quitara el dispositivo Soteria. Una vez recuperados sus poderes completos, masacró a casi todos los demás niños sujetos de prueba y al personal del laboratorio. Eleven, horrorizada, se enfrentó a él y, en un estallido de poder, lo lanzó a través de una grieta interdimensional hacia el Upside Down. Allí, su cuerpo fue horriblemente desfigurado por rayos y energía tóxica, transformándolo en la entidad monstruosa conocida como Vecna.\n\n"
        "Desde su exilio, Vecna ha estado explorando el Upside Down. Se revela que él fue quien dio forma a la sombra de partículas en el 'Mind Flayer' para que sirviera como su agente. Durante los eventos de la temporada 3, Vecna estaba activo en las sombras del Upside Down, orquestando las acciones del Mind Flayer y la posesión de Billy Hargrove para intentar matar a Eleven y abrir una puerta permanente a su mundo.",
  ),
];