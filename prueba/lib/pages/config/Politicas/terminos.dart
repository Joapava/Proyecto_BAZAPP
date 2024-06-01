import 'package:flutter/material.dart';

class Terminos extends StatefulWidget {
  const Terminos({super.key});

  @override
  State<Terminos> createState() => _TerminosState();
}

class _TerminosState extends State<Terminos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: principal(),
      )),
    );
  }

  Widget principal() {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Center(
          child: FittedBox(
            child: Text(
              'Terminos y Condiciones',
              style: TextStyle(fontFamily: 'Inter', fontSize: 25),
            ),
          ),
        ),
        buttonregreso(),
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
          width: 350,
          height: 800,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'TÉRMINOS DEL SERVICIO GENERALIDADES\n\nGang of five gestiona este sitio web. En todo el sitio, los términos "nosotros",'
                  ' "nos" y "nuestro" se refieren en lo sucesivo a Gang of five. Gang Of five ofrece esta página web, incluida toda la información,'
                  ' las herramientas y los servicios que se ponen en este sitio a disposición suya, el usuario, siempre y cuando acepte la totalidad '
                  'de los términos, condiciones, políticas y avisos contemplados aquí. ',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nAl visitar nuestro sitio y/o comprarnos algo, usted interactúa con nuestro "Servicio" y '
                  'reconoce como vinculantes los siguientes términos y condiciones (denominados en lo sucesivo '
                  '"Términos del servicio", "Términos"), incluidos aquellos términos y condiciones adicionales '
                  'y las políticas que se mencionan aquí y/o disponibles por medio de hipervínculo. Estos Términos '
                  'del servicio se aplican a todos los usuarios del sitio, incluyendo de manera enunciativa más no '
                  'limitativa los usuarios que son navegadores, proveedores, clientes, comerciantes y/o que '
                  'aporten contenido. Lea estos Términos del servicio detenidamente antes de acceder o utilizar '
                  'nuestra página web. Al acceder o utilizar cualquier parte del sitio, usted acepta estos Términos'
                  ' del servicio. Si no acepta la totalidad de los términos y condiciones de este acuerdo, no podrá '
                  'acceder al sitio web ni utilizar ningún servicio. Si estos Términos del servicio se considerasen una '
                  'oferta, la aceptación se limita expresamente a los presentes Términos del servicio. ',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nLas nuevas funciones o herramientas que se agreguen a la tienda actual también estarán sujetas a los '
                  'Términos del servicio. Puede revisar la versión más reciente de los Términos del servicio en cualquier '
                  'momento en esta página. Nos reservamos el derecho de actualizar, cambiar o reemplazar cualquier parte '
                  'de los presentes Términos del servicio mediante la publicación de actualizaciones o cambios en nuestra '
                  'página web. Es su responsabilidad revisar esta página periódicamente para ver los cambios. Su uso de la'
                  ' página web o el acceso a ella de forma continuada después de la publicación de cualquier cambio constituye'
                  ' la aceptación de dichos cambios.',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nNos proporcionan la plataforma de comercio electrónico en línea que nos permite venderle '
                  'nuestros productos y servicios.',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nSECCIÓN 1: Al aceptar los presentes Términos del servicio, usted declara que tiene la mayoría '
                  'de edad en su estado o provincia de residencia, o que es mayor de edad en su estado o provincia '
                  'de residencia y que nos ha dado su consentimiento para permitir que cualquiera de las personas '
                  'menores que dependen de usted utilice este sitio. No puede utilizar nuestros productos para ningún'
                  ' fin ilegal o no autorizado ni puede, al hacer uso del Servicio, infringir las leyes de su jurisdicción '
                  '(incluyendo de manera enunciativa más no limitativa, las leyes de derechos de autor). No transmitirá ningún'
                  ' gusano o virus informáticos ni ningún código de naturaleza destructiva. El incumplimiento o violación '
                  'de cualquiera de los Términos dará como resultado la rescisión inmediata de sus Servicios.',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nSECCIÓN 2: CONDICIONES GENERALES Nos reservamos el derecho de rechazar el servicio a cualquier persona, '
                  'por cualquier motivo, en cualquier momento. Usted comprende que su contenido (sin incluir la información '
                  'de la tarjeta de crédito) puede transferirse sin cifrar e implicar (a) transmisiones en varias redes; y (b)'
                  ' cambios para adaptarse a los requisitos técnicos de conexión de redes o dispositivos y cumplir con ellos.'
                  ' La información de la tarjeta de crédito siempre se cifra durante la transferencia a través de las redes. '
                  'Usted acepta no reproducir, duplicar, copiar, vender, revender ni aprovechar ninguna parte del Servicio, uso '
                  'del Servicio o acceso al Servicio ó cualquier contacto en el sitio web a través de la cual se presta el servicio,'
                  ' sin nuestro permiso expreso por escrito. Los encabezados utilizados en este acuerdo se incluyen sólo para facilitar '
                  'la lectura y no limitarán ni afectarán los presentes Términos.',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nSECCIÓN 3: EXACTITUD, TOTALIDAD Y CRONOLOGÍA DE LA INFORMACIÓN  No nos responsabilizamos si la información disponible '
                  'en este sitio no es precisa, completa o actualizada. El material presentado en este sitio se proporciona solo '
                  'para información general y no se debe confiar en él ni utilizarlo como la única base para tomar decisiones sin '
                  'consultar fuentes de información principales, más precisas, más completas o más recientes. Al confiar en cualquier '
                  'material de este sitio lo hace por su cuenta y riesgo. Este sitio puede contener cierta información histórica. La '
                  'información histórica, inevitablemente, no es actual y se proporciona únicamente como referencia. Nos reservamos el '
                  'derecho de modificar el contenido de este sitio en cualquier momento, pero no tenemos la obligación de actualizar '
                  'ninguna información en nuestro sitio. Usted acepta que es su responsabilidad controlar los cambios en nuestro sitio.',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nSECCIÓN 4: MODIFICACIONES AL SERVICIO Y PRECIOS Los precios de nuestros productos están sujetos a cambios sin previo'
                  ' aviso. Nos reservamos el derecho de modificar o discontinuar el Servicio (o cualquier parte o contenido del mismo)'
                  ' sin previo aviso en cualquier momento. No seremos responsables ante usted ni ante ningún tercero por ninguna modificación,'
                  ' cambio de precio, suspensión o interrupción del Servicio.',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nSECCIÓN 5: PRODUCTOS O SERVICIOS (si corresponde) Ciertos productos o servicios pueden estar disponibles exclusivamente'
                  ' online a través del sitio web. Estos productos o servicios pueden tener cantidades limitadas y están sujetos a devolución'
                  ' o cambio solo de acuerdo con nuestra Política de devolución. Hemos hecho todo lo viable para mostrar con la mayor precisión '
                  'posible los colores y las imágenes de nuestros productos que aparecen en la tienda. No podemos garantizar que la visualización '
                  'de cualquier color en el monitor de su computadora sea precisa. Nos reservamos el derecho, pero no estamos obligados, de limitar '
                  'las ventas de nuestros productos o servicios a cualquier persona, región geográfica o jurisdicción. Podemos ejercer este derecho caso '
                  'por caso. Nos reservamos el derecho de limitar las cantidades de cualquier producto o servicio que ofrecemos. Todas las descripciones'
                  ' de los productos o los precios de los productos están sujetos a cambios en cualquier momento y sin previo aviso, a nuestra entera '
                  'discreción. Nos reservamos el derecho de discontinuar cualquier producto en cualquier momento. Cualquier oferta de cualquier '
                  'producto o servicio que se realice en este sitio no tiene validez donde dicho producto o servicio esté prohibido. No garantizamos'
                  ' que la calidad de cualquier producto, servicio, información u otro material que usted haya comprado u obtenido cumplirá con sus'
                  ' expectativas, o que cualquier error en el Servicio se corregirá.',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nSECCIÓN 6: EXACTITUD DE LA FACTURACIÓN Y DE LA INFORMACIÓN DE LA CUENTA Nos reservamos el derecho de rechazar cualquier pedido que'
                  ' realice en nuestra tienda. Podemos, a nuestro exclusivo criterio, limitar o cancelar las cantidades compradas por persona, por hogar'
                  ' o por pedido. Estas restricciones pueden incluir pedidos realizados con la misma cuenta de cliente, la misma tarjeta de crédito o'
                  ' pedidos que usen la misma dirección de facturación o de envío. En el caso de que realicemos un cambio o cancelemos un pedido, '
                  'intentaremos notificarle vía correo electrónico o la dirección de facturación / número de teléfono proporcionados en el momento en '
                  'que se realizó el pedido. Nos reservamos el derecho de limitar o prohibir los pedidos que, a nuestra entera discreción, parezcan haber'
                  ' sido realizados por comerciantes, revendedores o distribuidores. Usted acepta suministrar información completa y precisa de la compra y'
                  ' cuenta actual, para todas las compras realizadas en nuestra tienda. Usted acepta actualizar rápidamente su cuenta y demás informaciones'
                  ', entre ellas, su dirección de correo electrónico, los números de tarjeta de crédito y las fechas de vencimiento, para que podamos completar'
                  ' sus transacciones y contactarlo según sea necesario. Para obtener más información, consulte nuestra Política de devoluciones.',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nSECCIÓN 7: HERRAMIENTAS OPCIONALES Podemos proporcionarle acceso a herramientas de terceros que no supervisamos, ni tenemos ningún control '
                  'sobre ellas, ni tampoco contribuimos. Usted reconoce y acepta que brindamos acceso a dichas herramientas "tal como se encuentran" y'
                  ' "según disponibilidad" sin garantías, representaciones ni condiciones de ningún tipo y sin ningún tipo de respaldo. No tendremos ninguna '
                  'responsabilidad como consecuencia del uso que haga de herramientas opcionales de terceros o en relación a ellas. Cualquier uso que haga de'
                  ' las herramientas opcionales ofrecidas a través del sitio es por su cuenta y riesgo, y debe asegurarse de estar familiarizado con los'
                  ' términos según los cuales los proveedores externos relevantes suministran dichas herramientas y aprobarlos. También podemos, en el futuro,'
                  ' ofrecer nuevos servicios o funciones a través del sitio web (incluido el lanzamiento de nuevas herramientas y recursos). Estas nuevas funciones'
                  ' o servicios también estarán sujetos a los presentes Términos de servicio. ',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nSECCIÓN 8: ENLACES DE TERCEROS Algunos contenidos, productos y servicios disponibles a través de nuestro Servicio pueden incluir recursos de '
                  'terceros. Los enlaces de terceros en este sitio pueden dirigirlo a páginas web de terceros que no están afiliados a nosotros. No somos responsables '
                  'de examinar o evaluar el contenido o la exactitud, ni garantizamos ni asumiremos ninguna obligación ni responsabilidad por los recursos o páginas'
                  ' web de terceros, ni por ningún otro material, producto o servicio de terceros. No somos responsables de ningún daño o perjuicio relacionado con '
                  'la compra o el uso de bienes, servicios, recursos, contenido o cualquier otra transacción realizada en conexión con sitios web de terceros. Revise'
                  ' cuidadosamente las políticas y prácticas de terceros, y asegúrese de comprenderlas antes de participar en cualquier transacción. Las quejas, reclamos'
                  ', inquietudes o preguntas referentes a productos de terceros deben dirigirse a estos.',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nSECCIÓN 9: COMENTARIOS DE LOS USUARIOS, OPINIONES Y OTRAS COMUNICACIONES Si, a petición nuestra, usted envía ciertas comunicaciones específicas (por ejemplo,'
                  ' participaciones en un concurso) o, sin una solicitud nuestra, envía ideas creativas, sugerencias, propuestas, planes u otros materiales, ya sea online,'
                  ' por correo electrónico, por correo postal, o de otro modo (denominado en lo sucesivo y de manera colectiva, "comentarios"), usted acepta que podemos,'
                  ' en cualquier momento, sin restricción: editar, copiar, publicar, distribuir, traducir y usar en cualquier medio cualquier comentario que usted nos envíe',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nSECCIÓN 10: INFORMACIÓN PERSONAL El envío de la información personal que haga a través de la tienda se rige por nuestra Política de privacidad.'
                  ' Para ver nuestra Política de privacidad. ',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nSECCIÓN 11: ERRORES, INEXACTITUDES Y OMISIONES Puede haber información en nuestro sitio o en el Servicio que, ocasionalmente, contenga errores'
                  ' tipográficos, inexactitudes u omisiones que puedan relacionarse con descripciones de productos, precios, promociones, ofertas, cargos por envío'
                  ' de productos, tiempos de tránsito y disponibilidad. Nos reservamos el derecho de corregir cualquier error, inexactitud u omisión, de cambiar'
                  ' o actualizar información, o cancelar pedidos si alguna información en el Servicio o en cualquier página web relacionada es inexacta en cualquier'
                  ' momento sin previo aviso (incluso después de haber enviado su pedido). No asumimos ninguna obligación de actualizar, modificar o aclarar la '
                  'información en el Servicio o en cualquier sitio web relacionado, incluyendo de manera enunciativa pero no limitativa, la información de precios,'
                  ' excepto cuando lo exija la ley. Ninguna actualización especificada o fecha de actualización aplicada en el Servicio o en cualquier sitio web '
                  'relacionado debe tomarse para indicar que toda la información en el Servicio o en cualquier sitio web relacionado se modificó o actualizó.',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nSECCIÓN 12: USOS PROHIBIDOS Además de las prohibiciones establecidas en los Términos del servicio, se le prohíbe utilizar el sitio o su'
                  ' contenido (a) para cualquier propósitoilegal; (b) para solicitar a otros que realicen o participen en cualquier acto ilegal; (c) para'
                  ' infringir cualquier reglamento, norma, ley u ordenanza local internacional, federal, provincial o estatal; (d) para infringir o violar'
                  ' nuestros derechos de propiedad intelectual o los derechosde propiedad intelectual de otros; (e) acosar, abusar, insultar, dañar, difamar,'
                  ' calumniar, denigrar, intimidar o discriminar por motivos de género, orientación sexual, religión, etnia, raza, edad, nacionalidad o '
                  'discapacidad; (f) enviar información falsa o engañosa; (g) cargar o transmitir virus o cualquier otro tipo de código dañino que afecte o'
                  ' pueda afectar a la funcionalidad o el funcionamiento del Servicio o de cualquier sitio web relacionado, de otros sitios web o de Internet;'
                  ' (h) recopilar o rastrear la información personal de otros; (i) enviar correo no deseado, phishing, pharm, pretexto, spider, rastrear o extraer;'
                  ' (j) para cualquier propósito obsceno o inmoral; o (k) para interferir o eludir las funciones de seguridad del Servicio o de cualquier sitio '
                  'web relacionado, o de otros sitios web o de Internet. Nos reservamos el derecho de dar por terminado su uso del Servicio o de cualquier sitio web'
                  ' relacionado por infringir cualquiera de los usos prohibidos. ',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nSECCIÓN 13: DESCARGO DE RESPONSABILIDAD DE GARANTÍAS; LIMITACIÓN DE RESPONSABILIDAD No garantizamos, representamos ni aseguramos que el uso '
                  'que haga de nuestro servicio será sin interrupciones, oportuno, seguro o sin errores. No garantizamos que los resultados que se puedan obtener '
                  'del uso del servicio sean exactos o confiables. Usted acepta que periódicamente, podamos eliminar el servicio por lapsos de tiempo'
                  ' indefinidos o cancelar el servicio en cualquier momento, sin notificarle. Usted acepta expresamente que su uso del servicio o la'
                  ' imposibilidad de utilizarlo corre por su riesgo. El servicio y todos los productos y servicios que se le entregan a través del servicio '
                  '(salvo que así lo especifiquemos nosotros) se ofrecen "tal como están" y "según disponibilidad" para su uso, sin ninguna representación,'
                  ' garantía o condición de ningún tipo, ya sea expresa o implícita, entre las que se incluyen todas las garantías implícitas o condiciones '
                  'de comerciabilidad, calidad comercial, idoneidad para un propósito particular, durabilidad, título y no violación. En ningún caso Gang of'
                  ' five, nuestros directores, funcionarios, empleados, afiliados, agentes, contratistas, pasantes, proveedores, proveedores de servicios o'
                  ' licenciantes serán responsables de cualquier lesión, pérdida, reclamo o cualquier daño directo, indirecto, incidental, punitivo, especial'
                  ' o consecuente de cualquier tipo, incluyendo de manera enunciativa más no limitativa; la pérdida de beneficios, pérdida de ingresos, pérdida'
                  ' de ahorros, pérdida de datos, costos de reemplazo o daños similares, ya sea por contrato, perjuicio (incluida la negligencia), responsabilidad '
                  'estricta o de otro tipo, que surjan del uso que haga de cualquiera de los servicios o de cualquier producto adquirido por medio del servicio,'
                  ' o para cualquier otro reclamo relacionado de alguna manera con su uso del servicio o de cualquier producto, incluidos, entre otros, cualquier error'
                  ' u omisión en cualquier contenido, o cualquier pérdida o daño de cualquier tipo en el que se haya incurrido como resultado del uso del servicio'
                  ' o de cualquier contenido (o producto) publicado, transmitido o puesto a disposición a través del servicio, incluso si se informa de su posibilidad'
                  '. Debido a que algunos estados o jurisdicciones no permiten la exclusión o la limitación de la responsabilidad por daños consecuentes o '
                  'incidentales, en dichos estados o jurisdicciones, nuestra responsabilidad se limitará a la extensión máxima de lo permitido por la ley.',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nSECCIÓN 14: INDEMNIZACIÓN Usted acepta indemnizar, defender y mantener indemne a Gang of five y a nuestra empresa matriz, subsidiarias'
                  ', afiliadas, asociados, funcionarios, directores, agentes, contratistas, licenciantes, proveedores de servicios, subcontratistas, proveedores'
                  ', pasantes y empleados.',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nSECCIÓN 15: DIVISIBILIDAD En caso de que se determine que alguna disposición de los presentes Términos del servicio sea ilegal, nula o inaplicable'
                  ', dicha disposición será, no obstante, ejecutable en la medida en que lo permita la legislación aplicable, y la parte inaplicable se considerará'
                  ' separada de los presentes Términos del servicio, sin que dicha determinación afecte a la validez y aplicabilidad de las demás disposiciones.',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nSECCIÓN 16: RESCISIÓN Las obligaciones y responsabilidades de las partes incurridas antes de la fecha de rescisión seguirán vigentes después de'
                  ' la rescisión de este contrato a todos los efectos. Estos Términos del servicio se encuentran vigentes a menos que usted o nosotros los '
                  'prescindamos. Puede rescindir los presentes Términos del servicio en cualquier momento al notificarnos que ya no desea utilizar nuestros'
                  ' Servicios o cuando cese de utilizar nuestro sitio. Si a nuestro juicio usted incumple, o sospechamos que ha incumplido con cualquier '
                  'término o disposición de los presentes Términos del servicio, podemos rescindir igualmente este acuerdo en cualquier momento sin'
                  ' previo aviso y usted seguirá siendo responsable de todos los importes adeudados, hasta la fecha de rescisión inclusive; y/o'
                  ' en consecuencia podemos negarle el acceso a nuestros Servicios (o a parte de ellos).',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nSECCIÓN 17: ACUERDO COMPLETO El hecho de que no ejerzamos o hagamos valer algún derecho o disposición de los presentes Términos del '
                  'Servicio no constituirá una renuncia a dicho derecho o disposición. Estos Términos de servicio y cualquier política o regla de funcionamiento'
                  ' que hayamos publicado en este sitio o con respecto al Servicio constituye el acuerdo y el entendimiento completo entre usted y nosotros,'
                  ' y rigen su uso del Servicio, sustituyendo a cualquier acuerdo, comunicación o propuesta anterior o contemporánea, ya sea oral o escrita, entre '
                  'usted y nosotros (incluyendo de manera enunciativa más no limitativa, las versiones anteriores de los Términos del servicio). ',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nJurisdicción y competencia El Usuario acepta que la legislación y leyes aplicables serán las mexicanas y para cualquier disputa,'
                  ' juicio, controversia de cualquier índole o materia deberán someterse a los Juzgados y Tribunales de la Ciudad de México. Previo'
                  ' a cualquier inicio de juicio o controversia ambas partes se comprometen a resolver de manera amistosa mediante una conciliación. ',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Text(
                  '\nÚltima actualización: 7 de mayo de 2024',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonregreso() {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: FloatingActionButton(
            heroTag: 'back',
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
            elevation: 0,
            child: Image.asset('assets/arrow-back.png'),
          ),
        ),
      ],
    );
  }

  @override
  void dispose(){
    super.dispose();
  }
}
