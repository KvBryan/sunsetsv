import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'z13nocm8': {
      'es': 'SunSetSV',
      'en': 'SunSetSV',
    },
    'amx9lxz6': {
      'es': 'Bienvenido!',
      'en': 'Welcome!',
    },
    'pp3lox3t': {
      'es': 'Correo Electrónico',
      'en': 'Mail',
    },
    'yv1xe1av': {
      'es': 'Ingrese su correo...',
      'en': 'Enter your email...',
    },
    '3cb5foss': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    '4j39dp7u': {
      'es': 'Ingrese su contraseña...',
      'en': 'Please enter your password...',
    },
    'mvmkdd4c': {
      'es': '¿Olvidó su contraseña?',
      'en': 'Forgot your password?',
    },
    '11odlbpp': {
      'es': 'Iniciar Sesión',
      'en': 'Login',
    },
    '3hwqdtdo': {
      'es': '¿No tienes una cuenta?',
      'en': 'Don\'t have an account?',
    },
    'guup22i7': {
      'es': 'Crear Cuenta',
      'en': 'Create Account',
    },
    'hwq1cjbk': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // createAccount
  {
    'o0vj8nam': {
      'es': 'SunSetSV',
      'en': 'SunSetSV',
    },
    'gj5d69kj': {
      'es': 'Registrate con Nosotros!',
      'en': 'Register with us!',
    },
    'h071es2v': {
      'es': 'Nombre Completo',
      'en': 'Email Address',
    },
    '9s27sbda': {
      'es': 'Ingrese su nombre completo...',
      'en': 'Enter your email here...',
    },
    '8w0y2iv2': {
      'es': 'Correo Electrónico',
      'en': '',
    },
    'f6lsrq9k': {
      'es': 'Ingrese su correo electrónico...',
      'en': '',
    },
    'q28a67os': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    '4ftcwgwl': {
      'es': 'Ingrese su contraseña...',
      'en': 'Enter your email here...',
    },
    'n4mwhuf9': {
      'es': 'Confirmar Contraseña',
      'en': '',
    },
    'syc8v22e': {
      'es': 'Ingrese su contraseña...',
      'en': '',
    },
    'bmtsw6g3': {
      'es': '¿Ya tienes una cuenta?',
      'en': 'Do you already have an account?',
    },
    'pjw2ekmc': {
      'es': 'Iniciar Sesión',
      'en': 'Login',
    },
    '0q2doqh3': {
      'es': 'Crear Cuenta',
      'en': 'Create Account',
    },
    'e94tw66w': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // homePage_MAIN
  {
    '0754et3j': {
      'es': 'Encuentra tu lugar para disfrutar',
      'en': 'Find your Dream Space To Getaway',
    },
    '201xib9b': {
      'es': 'DIrección, ciudad...',
      'en': 'Address, city, state...',
    },
    'i5miom8r': {
      'es': 'Buscar',
      'en': 'Search',
    },
    'kbrg3d17': {
      'es': 'Rating',
      'en': 'Rating',
    },
    'szk9urao': {
      'es': 'Inicio',
      'en': 'Home',
    },
  },
  // propertyDetails
  {
    '5z4adsde': {
      'es': 'Reviews',
      'en': 'Reviews',
    },
    'br080kz8': {
      'es': 'DESCRIPCIÓN',
      'en': 'DESCRIPTION',
    },
    '1pq6ujxk': {
      'es': 'Comodidades',
      'en': 'Amenities',
    },
    'al427bdh': {
      'es': 'Comentarios de Usuarios',
      'en': 'What people are saying',
    },
    'dfl9bxej': {
      'es': 'Josh Richardson',
      'en': 'Josh Richardson',
    },
    '0nrlqqlm': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
    },
    '9venfb2r': {
      'es': 'Josh Richardson',
      'en': 'Josh Richardson',
    },
    'mp9eki1l': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
    },
    'gvalebwb': {
      'es': '\$156',
      'en': '\$156',
    },
    'p61f80pm': {
      'es': '+ Impuestos',
      'en': '+ taxes/fees',
    },
    'jnku5j3x': {
      'es': 'Por Día',
      'en': 'per night',
    },
    'urwr8u0x': {
      'es': 'Reservar Ahora',
      'en': 'Book Now',
    },
    'wdsvn1p3': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // searchProperties
  {
    '3o7xnf5w': {
      'es': 'Buscar',
      'en': 'Search',
    },
    '7thqie41': {
      'es': 'Address, city, state...',
      'en': 'Address, city, state...',
    },
    'v56ji4vf': {
      'es': 'Buscar',
      'en': 'Search',
    },
    '95dfdzi5': {
      'es': 'Rating',
      'en': 'Rating',
    },
    'peqixema': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // myTrips
  {
    'xwiap90z': {
      'es': 'Próximo',
      'en': 'Upcoming',
    },
    '4tnr8h30': {
      'es': ' - ',
      'en': '-',
    },
    '613c42yf': {
      'es': 'Total',
      'en': 'Total',
    },
    'e1bz1a0j': {
      'es': 'Completado',
      'en': 'Completed',
    },
    'mv7lc0xq': {
      'es': 'Cancelado',
      'en': 'Cancelled',
    },
    '79z7rpcz': {
      'es': ' - ',
      'en': '-',
    },
    '5xckuqfq': {
      'es': 'Tarifa de Vacación',
      'en': 'Rate Trip',
    },
    'j4waiw14': {
      'es': 'Mis Vacaciones',
      'en': 'My Trips',
    },
    '6kfmyhz7': {
      'es': 'Mis Vacacioes',
      'en': 'My Trips',
    },
  },
  // tripDetails
  {
    'uhjml2kx': {
      'es': 'Detalles de Vacación',
      'en': 'Trip Details',
    },
    '157enmh3': {
      'es': 'Datos de Vacación',
      'en': 'Trip dates',
    },
    '9jafr4mw': {
      'es': ' - ',
      'en': '-',
    },
    'on86sgja': {
      'es': 'Destino',
      'en': 'Destination',
    },
    '6e72fovl': {
      'es': 'Desglose de Precio',
      'en': 'Price Breakdown',
    },
    'b61968fn': {
      'es': 'Precio Base',
      'en': 'Base Price',
    },
    '05gd6ngt': {
      'es': 'Impuestos',
      'en': 'Taxes',
    },
    'lavsuw99': {
      'es': '\$24.20',
      'en': '\$24.20',
    },
    'kmc7cc5g': {
      'es': 'Tarifa de Limpieza',
      'en': 'Cleaning Fee',
    },
    'cx9rm0jc': {
      'es': '\$40.00',
      'en': '\$40.00',
    },
    '49vm7ugw': {
      'es': 'Total',
      'en': 'Total',
    },
    'hh47enm9': {
      'es': 'Tu vacación está completada!',
      'en': 'Your trip has been completed!',
    },
    'nsr6uzpy': {
      'es': 'Revisión de Vacación',
      'en': 'Review Trip',
    },
    'mo1kgpyz': {
      'es': 'Información del Anfitrión',
      'en': 'Host Info',
    },
    '0dhpv536': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // propertyReview
  {
    'e53rjbkn': {
      'es': 'Comentarios',
      'en': 'Reviews',
    },
    '16awlte0': {
      'es': '# of Ratings',
      'en': '# of Ratings',
    },
    'h0r4o1s4': {
      'es': 'Avg. Rating',
      'en': 'Avg. Rating',
    },
    'vgmj48b2': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // bookNow
  {
    '6vy14s7h': {
      'es': 'Reservar Ahora',
      'en': 'Book Now',
    },
    'l3d4d5gy': {
      'es': 'Escoger Fecha',
      'en': 'Select Date',
    },
    'm9drewh5': {
      'es': 'Número de Personas',
      'en': 'Number of People',
    },
    'jiqaj9ij': {
      'es': 'Información de Pago',
      'en': 'Payment Information',
    },
    'pp1pxfog': {
      'es': 'Precio Base',
      'en': 'Base Price',
    },
    'y6ogjbhd': {
      'es': '\$156.00',
      'en': '\$156.00',
    },
    '4erb5yv1': {
      'es': 'Impuesto',
      'en': 'Tax',
    },
    'nh3hxfnv': {
      'es': '\$24.20',
      'en': '\$24.20',
    },
    'gey77htf': {
      'es': 'Tarifa de Limpieza',
      'en': 'Cleaning Fee',
    },
    '02tg96i2': {
      'es': '\$40.00',
      'en': '\$40.00',
    },
    'h0vqm4tg': {
      'es': 'Total',
      'en': 'Total',
    },
    '3lauk589': {
      'es': '\$230.20',
      'en': '\$230.20',
    },
    'sw2hl53r': {
      'es': 'Reservar Ahora',
      'en': 'Book Now',
    },
    '8zbx3k0u': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // profilePage
  {
    'i7fens1u': {
      'es': 'Modo Oscuro',
      'en': 'Switch to Dark Mode',
    },
    'cdxlb1b6': {
      'es': 'Modo Claro',
      'en': 'Switch to Light Mode',
    },
    'dmk30duh': {
      'es': 'Detalles de la cuenta',
      'en': 'Account Details',
    },
    'zpzdvz6z': {
      'es': 'Editar Perfil',
      'en': 'Edit Profile',
    },
    'qqise1lx': {
      'es': 'Información de Pago',
      'en': 'Payment Information',
    },
    'u1ksqoww': {
      'es': 'Cambiar Contraseña',
      'en': 'Change Password',
    },
    'jlzisgxp': {
      'es': 'Mis Ranchos',
      'en': 'My Properties',
    },
    'k9amytjp': {
      'es': 'Mis Reservas',
      'en': 'My Bookings',
    },
    'fzb0wgha': {
      'es': 'Cerrar Sesión',
      'en': 'Log Out',
    },
    'otnlakwg': {
      'es': 'Agregar Rancho',
      'en': 'Add Property',
    },
    'pvftql1g': {
      'es': 'Perfil',
      'en': 'Profile',
    },
  },
  // paymentInfo
  {
    '1lwf3wp9': {
      'es': 'Guardar Cambios',
      'en': 'Save Changes',
    },
    'd3o8vsry': {
      'es': 'Información de Pago',
      'en': 'Payment Information',
    },
    'xygww2sl': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // editProfile
  {
    '5otdqvjy': {
      'es': 'Editar Perfil',
      'en': 'Edit Profile',
    },
    'lnu59v2o': {
      'es': 'Cambiar Foto',
      'en': 'Change Photo',
    },
    '2etfg6fr': {
      'es': 'Nombre Completo',
      'en': 'Full Name',
    },
    'cagimr2m': {
      'es': 'Your full name...',
      'en': 'Your full name...',
    },
    'wbni1h4t': {
      'es': 'Correo Electrónico',
      'en': 'Email',
    },
    'f2n5m89h': {
      'es': 'Your email..',
      'en': 'Your email..',
    },
    'a7xh5l9w': {
      'es': 'Biografía',
      'en': 'Bio',
    },
    'ybtuuzjs': {
      'es': 'A little about you...',
      'en': 'A little about you...',
    },
    '59l4y1ys': {
      'es': 'Guardar Cambios',
      'en': 'Save Changes',
    },
    'ym0lqce1': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // changePassword
  {
    '98t4n6xw': {
      'es': 'Correo Electrónico',
      'en': 'Email',
    },
    'vzxqcsyf': {
      'es': 'Your email..',
      'en': 'Your email..',
    },
    'm9xj4jz1': {
      'es':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña. Por favor, introduzca la dirección de correo electrónico asociada a su cuenta.',
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
    },
    '0jymtpe1': {
      'es': 'Enviar Link',
      'en': 'Send Link',
    },
    '7u50zs2w': {
      'es': 'Cambiar Contraseña',
      'en': 'Change Password',
    },
    'ncm8upn3': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // createProperty_1
  {
    '7k8a9sjv': {
      'es': 'NOMBRE DEL RANCHO',
      'en': 'PROPERTY NAME',
    },
    '4j67few2': {
      'es': 'Las Flores...',
      'en': 'Something Catchy...',
    },
    'z4t8lj96': {
      'es': 'DIRECCIÓN DEL RANCHO',
      'en': 'PROPERTY ADDRESS',
    },
    'qc60d4mh': {
      'es': '123 Zacatecoluca...',
      'en': '123 Disney ways here…',
    },
    '96unarac': {
      'es': 'CIUDAD O DEPARTAMENTO',
      'en': 'NEIGHBORHOOD',
    },
    'rhs2tkm4': {
      'es': 'La Paz…',
      'en': 'Neighborhood or city…',
    },
    'btg0n919': {
      'es': 'DESCRIPCIÓN',
      'en': 'DESCRIPTION',
    },
    'rj969cij': {
      'es':
          'Ubicado en el corazón de la campiña, Rancho La Flores es un refugio de tranquilidad y belleza natural…',
      'en': 'Neighborhood or city…',
    },
    'brj06hce': {
      'es': 'PASO',
      'en': 'STEP',
    },
    '836kdpmy': {
      'es': '1/3',
      'en': '1/3',
    },
    'gr9ydll8': {
      'es': 'SIGUIENTE',
      'en': 'NEXT',
    },
    '4cmfmk35': {
      'es': 'Crear Rancho',
      'en': 'Create Property',
    },
    'vw8c77u4': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // HomePage_ALT
  {
    'fjarsc3v': {
      'es': 'Bienvenido!',
      'en': 'Welcome!',
    },
    'g22rm99c': {
      'es': 'Encuentra tus vacaciones a un click',
      'en': 'Find your Dream Space',
    },
    'sra519ik': {
      'es': 'DIrección, ciudad...',
      'en': 'Address, city, state...',
    },
    '0s2fis44': {
      'es': 'Buscar',
      'en': 'Search',
    },
    'k995uffl': {
      'es': '4/5 reviews',
      'en': '4/5 reviews',
    },
    'wmrxkmea': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // createProperty_2
  {
    'dq7xud0x': {
      'es': 'CREAR RANCHO',
      'en': 'Create Property',
    },
    'istxc6v6': {
      'es': 'ELEGIR TUS COMOCIDADES',
      'en': 'CHOOSE YOUR AMENITIES',
    },
    'cuyf1xrb': {
      'es': 'Piscina',
      'en': 'Pool',
    },
    'x7vbdoo6': {
      'es': 'Aire Acondicionado',
      'en': 'Air Conditioning (AC)',
    },
    'k59wl2oc': {
      'es': 'Calefacción',
      'en': 'Heating',
    },
    '06whl08n': {
      'es': 'Lavadora',
      'en': 'Washer',
    },
    'lp6132o4': {
      'es': 'Secadora',
      'en': 'Dryer',
    },
    'p7spww1j': {
      'es': 'Se Admiten Mascotas',
      'en': 'Pet Friendly',
    },
    '2butvjd6': {
      'es': 'GYM',
      'en': 'Workout Facility',
    },
    'xqk5ubgg': {
      'es': 'Vida Nocturna',
      'en': 'Night Life',
    },
    'zbxbisw9': {
      'es': 'PASO',
      'en': 'STEP',
    },
    'w0szwhuf': {
      'es': '2/3',
      'en': '23',
    },
    '6ad20biq': {
      'es': 'SIGUIENTE',
      'en': 'NEXT',
    },
    'qqmst42x': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // createProperty_3
  {
    'qfumnij7': {
      'es': 'Crear Rancho',
      'en': 'Create Property',
    },
    'pfkaho47': {
      'es': 'PRECIO DE ESTANCIA',
      'en': 'PRICE PER NIGHT',
    },
    '4c5lxr2q': {
      'es': '\$',
      'en': '\$ Price',
    },
    'vpmrv0oj': {
      'es': 'MÍNIMO DE DÍAS',
      'en': 'MINIMUM NIGHT STAY',
    },
    'fgq4k48p': {
      'es': 'PORCENTAJE DE IMPUESTO',
      'en': 'TAX RATE',
    },
    'ypfx7e62': {
      'es': '%',
      'en': '% Rate',
    },
    'w0ge84xk': {
      'es': 'TARIFA DE LIMPIEZA',
      'en': 'CLEANING FEE',
    },
    'rr87pcwi': {
      'es': '\$',
      'en': '\$ Price',
    },
    '5m5sb98c': {
      'es': 'Notas Adicionales',
      'en': 'Additional Notes',
    },
    'ud165uen': {
      'es': 'Notas Adicionales...',
      'en': 'Additional notes...',
    },
    'ofih1ezu': {
      'es': 'PASO',
      'en': 'STEP',
    },
    'tn5feww0': {
      'es': '3/3',
      'en': '3/3',
    },
    'nzs4y6e9': {
      'es': 'PUBLICAR',
      'en': 'PUBLISH',
    },
    'vb70tds8': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // myProperties
  {
    'hudphcu0': {
      'es': 'Publicados',
      'en': 'Published',
    },
    '60ihgz2u': {
      'es': 'Precio Por Día',
      'en': 'Price Per Night',
    },
    'khb4oxzp': {
      'es': 'Drafts',
      'en': 'Drafts',
    },
    'gh5jnl44': {
      'es': 'Precio Por Día',
      'en': 'Price Per Night',
    },
    'pvqst76m': {
      'es': 'Mis Ranchos',
      'en': 'My Properties',
    },
    'v34xf1i0': {
      'es': 'My Trips',
      'en': 'My Trips',
    },
  },
  // propertyDetails_Owner
  {
    'qxqppnhm': {
      'es': 'Reviews',
      'en': 'Reviews',
    },
    'dg7ka47z': {
      'es': 'DESCRIPCIÓN',
      'en': 'DESCRIPTION',
    },
    'm9cle5na': {
      'es': 'Comodidades',
      'en': 'Amenities',
    },
    'zrpyvzip': {
      'es': 'Comentarios de Usuarios',
      'en': 'What people are saying',
    },
    '411jw1iz': {
      'es': 'Josh Richardson',
      'en': 'Josh Richardson',
    },
    'tev33iiv': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
    },
    'kylqfpk0': {
      'es': 'Josh Richardson',
      'en': 'Josh Richardson',
    },
    '25yed6bw': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
    },
    'stmn3t9o': {
      'es': '\$156',
      'en': '\$156',
    },
    'iwr0lml8': {
      'es': '+ Impuestos',
      'en': '+ taxes/fees',
    },
    'wc3refp2': {
      'es': 'Por Día',
      'en': 'per night',
    },
    '5v8dmjtk': {
      'es': 'Editar Rancho',
      'en': 'Edit Property',
    },
    '4lg32cvt': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // myBookings
  {
    '3j6vw8k7': {
      'es': 'Próximo',
      'en': 'Upcoming',
    },
    'pf5j95ar': {
      'es': ' - ',
      'en': '-',
    },
    'abcc77uq': {
      'es': 'Total',
      'en': 'Total',
    },
    '1juadj0y': {
      'es': 'Completado',
      'en': 'Completed',
    },
    'cjbg5o5m': {
      'es': ' - ',
      'en': '-',
    },
    'xtjncs9i': {
      'es': 'Total',
      'en': 'Total',
    },
    'lrrn4pzc': {
      'es': 'Mis Reservaciones',
      'en': 'My Bookings',
    },
    'dzkl00ui': {
      'es': 'My Trips',
      'en': 'My Trips',
    },
  },
  // tripDetailsHOST
  {
    'l2fjr75n': {
      'es': 'Detalles de Vacación',
      'en': 'Trip Details',
    },
    '6qmh199a': {
      'es': 'Datos de Vacación',
      'en': 'Trip dates',
    },
    'w7f3lbj0': {
      'es': ' - ',
      'en': '-',
    },
    '0x0v7z7e': {
      'es': 'Destino',
      'en': 'Destination',
    },
    'lk7qmsjn': {
      'es': 'Desglose de Precio',
      'en': 'Price Breakdown',
    },
    'qk4box9y': {
      'es': 'Precio Base',
      'en': 'Base Price',
    },
    '0hti9hjt': {
      'es': 'Impuestos',
      'en': 'Taxes',
    },
    'nqeguzww': {
      'es': '\$24.20',
      'en': '\$24.20',
    },
    'k0677swv': {
      'es': 'Tarifa de Limpieza',
      'en': 'Cleaning Fee',
    },
    'oft8fdfr': {
      'es': '\$40.00',
      'en': '\$40.00',
    },
    'dybf2qfq': {
      'es': 'Total',
      'en': 'Total',
    },
    '8bk2yuw8': {
      'es': 'Marque esta vacación como completo!',
      'en': 'Mark this trip as complete below.',
    },
    'jn5fuokt': {
      'es': 'Marcar como Completo',
      'en': 'Mark as Complete',
    },
    '8hc5y4wr': {
      'es': 'Información del Huésped',
      'en': 'Guest Info',
    },
    'kk6rtd0y': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // editProperty_1
  {
    'zsv9yq1x': {
      'es': 'Editar Rancho',
      'en': 'Edit Property',
    },
    'n65bxlvg': {
      'es': 'NOMBRE DEL RANCHO',
      'en': 'PROPERTY NAME',
    },
    '6is5ynzt': {
      'es': 'Something Catchy...',
      'en': 'Something Catchy...',
    },
    'pm3b42te': {
      'es': 'DIRECCIÓN DEL RANCHO',
      'en': 'PROPERTY ADDRESS',
    },
    '1qtbbjme': {
      'es': '123 Disney way here…',
      'en': '123 Disney ways here…',
    },
    'sgqp6e8x': {
      'es': 'VECINDARIO',
      'en': 'NEIGHBORHOOD',
    },
    '31cwexd3': {
      'es': 'Neighborhood or city…',
      'en': 'Neighborhood or city…',
    },
    '6nrga356': {
      'es': 'DESCRIPCIÓN',
      'en': 'DESCRIPTION',
    },
    'l726ogg7': {
      'es': 'Neighborhood or city…',
      'en': 'Neighborhood or city…',
    },
    'v1moayfn': {
      'es': 'PASO',
      'en': 'STEP',
    },
    's4h515ae': {
      'es': '1/3',
      'en': '1/3',
    },
    'g3dwv9er': {
      'es': 'SIGUIENTE',
      'en': 'NEXT',
    },
    'sxz6v1ff': {
      'es': 'We need to know the name of the place...',
      'en': 'We need to know the name of the place...',
    },
    'l0r0mr1j': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // editProperty_2
  {
    '2pjv21we': {
      'es': 'Editar Rancho',
      'en': 'Edit Property',
    },
    '9o2444x3': {
      'es': 'ELEGIR TUS COMODIDADES',
      'en': 'CHOOSE YOUR AMENITIES',
    },
    '9rxb1km3': {
      'es': 'Piscina',
      'en': 'Pool',
    },
    'mwzzfc15': {
      'es': 'Aire Acondicionado',
      'en': 'Air Conditioning (AC)',
    },
    'w6lylwe2': {
      'es': 'Calefacción',
      'en': 'Heating',
    },
    'b5ouatcn': {
      'es': 'Lavadora',
      'en': 'Washer',
    },
    '2acwwq0q': {
      'es': 'Secadora',
      'en': 'Dryer',
    },
    'ef815vb2': {
      'es': 'Se Aceptan Mascotas',
      'en': 'Pet Friendly',
    },
    'azwpqb0u': {
      'es': 'GYM',
      'en': 'Workout Facility',
    },
    '0tzix46q': {
      'es': 'Vida Nocturna',
      'en': 'Night Life',
    },
    'oc35inoe': {
      'es': 'PASO',
      'en': 'STEP',
    },
    'zv7f8p6x': {
      'es': '2/3',
      'en': '23',
    },
    'qlpi1a6u': {
      'es': 'SIGUIENTE',
      'en': 'NEXT',
    },
    '4rvqhuik': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // editProperty_3
  {
    'gsetvzf8': {
      'es': 'Editar Ranho',
      'en': 'Edit Property',
    },
    '0wc0wx4q': {
      'es': 'PRECIO DE ESTANCIA',
      'en': 'PRICE PER NIGHT',
    },
    'ud9jdwjq': {
      'es': '\$ Price',
      'en': '\$ Price',
    },
    'm00yxcuj': {
      'es': 'MÍNIMO DE DÍAS',
      'en': 'MINIMUM NIGHT STAY',
    },
    'cs3igyiy': {
      'es': 'PORCENTAJE DE IMPUESTOS',
      'en': 'TAX RATE',
    },
    'hwozfzhr': {
      'es': '% Rate',
      'en': '% Rate',
    },
    '4mflsd9z': {
      'es': 'TARIFA DE LIMPIEZA',
      'en': 'CLEANING FEE',
    },
    '4us6tsvp': {
      'es': '\$ Price',
      'en': '\$ Price',
    },
    '9d90dx8c': {
      'es': 'Notas Adicionales',
      'en': 'Additional Notes',
    },
    'yb960vnu': {
      'es': 'Additional notes...',
      'en': 'Additional notes...',
    },
    '8m9st89e': {
      'es': 'Listado Activo',
      'en': 'Listing is Live',
    },
    'jcm7gk1h': {
      'es': 'Actívalo para que los huéspedes empiecen a reservar tu anuncio.',
      'en': 'Turn this on for guests to start booking your listing.',
    },
    'rm4yp5mr': {
      'es': 'PASO',
      'en': 'STEP',
    },
    '9qiyauel': {
      'es': '3/3',
      'en': '3/3',
    },
    'n7cd9qpt': {
      'es': 'GUARDAR CAMBIOS',
      'en': 'Save Changes',
    },
    'utnu4p0g': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // bottomSheet
  {
    'd6emsaax': {
      'es': 'Sesión Reservada!',
      'en': '',
    },
    '51f90j4s': {
      'es': 'Has reservado con éxito una sesión en:',
      'en': '',
    },
    'sa7mbvrx': {
      'es': 'Lun, Dic 11 - 2021',
      'en': '',
    },
  },
  // total
  {
    'bphpoear': {
      'es': 'Orden Total',
      'en': '',
    },
    'tswqxzb4': {
      'es':
          'El total de su pedido es un resumen de todos los artículos de su pedido menos las tarifas e impuestos asociados con su compra.',
      'en': '',
    },
    'njsk61yp': {
      'es': 'Aceptar',
      'en': '',
    },
  },
  // changePhoto
  {
    '48ykgzpz': {
      'es': 'Cambiar Foto de Perfil',
      'en': 'Change Profile Photo',
    },
    '2cvoe2gv': {
      'es': 'Subir Foto',
      'en': 'Upload Photo',
    },
    '3xg4683p': {
      'es': 'Guardar Foto',
      'en': 'Save Photo',
    },
  },
  // reviewTrip
  {
    'fvthryyb': {
      'es': 'Puntuar Tu Vacación',
      'en': 'Rate Your Trip',
    },
    'khp1oh1y': {
      'es': 'Háganos saber lo que pensó del lugar a continuación!',
      'en': 'Let us know what you thought of the place below!',
    },
    '25cdv5mg': {
      'es': '¿Cómo lo calificarías?',
      'en': 'How would you rate it?',
    },
    's64hcvnx': {
      'es': 'Por favor, escríbe una breve descripción del rancho...',
      'en': 'Please leave a description of the place...',
    },
    'iyb0mg57': {
      'es': 'Enviar Reseña',
      'en': 'Submit Review',
    },
  },
  // changeMainPhoto
  {
    'hlaksavc': {
      'es': 'Cambiar Foto Principal',
      'en': 'Change Main Photo',
    },
    'y4e1uxkp': {
      'es': 'Subir Foto',
      'en': 'Upload Photo',
    },
    'ddj9fle6': {
      'es': 'Guardar Foto',
      'en': 'Save Photo',
    },
  },
  // cancelTrip
  {
    'xub5a25m': {
      'es': 'Cancelar Vacación',
      'en': '',
    },
    'rwvmae96': {
      'es':
          'Si desea cancelar su vacación, deje una nota a continuación para enviar al anfitrión.',
      'en': '',
    },
    'j01y5i7m': {
      'es': 'Razón de la Cancelación...',
      'en': '',
    },
    '8drifx2z': {
      'es': 'Sí, Cancelar Vacación',
      'en': '',
    },
    'evi9xjyw': {
      'es': 'Olvídalo',
      'en': '',
    },
  },
  // cancelTripHOST
  {
    'za86tddn': {
      'es': 'Cancel Vacación',
      'en': '',
    },
    'wed3knd1': {
      'es':
          'Si desea cancelar su vacación, deje una nota a continuación para enviar al anfitrión.',
      'en': '',
    },
    'xob3qtsm': {
      'es': 'Motivo de la cancelación...',
      'en': '',
    },
    'fv9qs5fw': {
      'es': 'Sí, Cancelar Vacación',
      'en': '',
    },
    'ijespdbi': {
      'es': 'Olvídalo',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'adni4k6c': {
      'es': '',
      'en': '',
    },
    'on3693fp': {
      'es': '',
      'en': '',
    },
    'i2wx8am3': {
      'es': '',
      'en': '',
    },
    'n6fnig5e': {
      'es': '',
      'en': '',
    },
    'q18w4bts': {
      'es': '',
      'en': '',
    },
    'tprzct8f': {
      'es': '',
      'en': '',
    },
    'qxpek95g': {
      'es': '',
      'en': '',
    },
    'ukriu5oi': {
      'es': '',
      'en': '',
    },
    '9r5g4jzs': {
      'es': '',
      'en': '',
    },
    'nj9auzzv': {
      'es': '',
      'en': '',
    },
    'by2ey6n7': {
      'es': '',
      'en': '',
    },
    'ed0zblqi': {
      'es': '',
      'en': '',
    },
    'dw5emwuz': {
      'es': '',
      'en': '',
    },
    'zvodcq0c': {
      'es': '',
      'en': '',
    },
    'ue414jyi': {
      'es': '',
      'en': '',
    },
    '6nnbhnrz': {
      'es': '',
      'en': '',
    },
    '961l216r': {
      'es': '',
      'en': '',
    },
    '3hde6zpd': {
      'es': '',
      'en': '',
    },
    'svh4p5ea': {
      'es': '',
      'en': '',
    },
    '76na7yui': {
      'es': '',
      'en': '',
    },
    'tp2921zp': {
      'es': '',
      'en': '',
    },
    'af7o0whw': {
      'es': '',
      'en': '',
    },
    'wy7vwmaz': {
      'es': '',
      'en': '',
    },
    'tbdtsyvf': {
      'es': '',
      'en': '',
    },
    'qhu7uvfy': {
      'es': '',
      'en': '',
    },
    'yvht500r': {
      'es': '',
      'en': '',
    },
    'bcyqcyz7': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
