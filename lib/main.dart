import 'package:flutter/material.dart';

//Экран Авторизации
class AuthorizationRoute extends StatelessWidget {
  const AuthorizationRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Авторизация'),
        ),
      ),
       body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 3,
            child:Container(
                  width: 400,
                  height: 10,
                  color: Colors.white,
                  child: const Center(
                      child: TextField(decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.android),
                    hintText: "Введите логин",
                    )
                  ),
                  ),
                ),
              ),
          Expanded(
            flex: 3,
            child:Container(
                  width: 400,
                  height: 10,
                  color: Colors.white,
                  child: const Center(
                      child: TextField(decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.https),
                    hintText: "Пароль",
                    )
                  ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: 400,
                  height: 20, 
           child: ElevatedButton(
              child: const Text('Нет аккаунта? Зарегистрироваться!'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegistrationRoute()
                  ),
                );
              },
            ),
                ),
            ),
            const SizedBox(height: 40),
            Expanded(
              flex: 1,
              child: SizedBox(
                  width: 400,
                  height: 20, 
           child: ElevatedButton(
              child: const Text('Войти'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeRoute()
                  ),
                );
              },
            ),
              ),
            ),
            const SizedBox(height: 30),
          ]
        ),
      ),
    );
  }
}







//Экран регистрации
class RegistrationRoute extends StatelessWidget {
  const RegistrationRoute({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Регистрация'),
        ),
      ),
      body: Center(
          child: Column(
            children: <Widget>[ 
              Expanded(
                flex: 2,
            child:Container(
                  width: 400,
                  height: 10,
                  color: Colors.white,
                  child: const Center(
                      child: TextField(decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.android),
                    hintText: "Введите логин",
                    )
                  ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                flex: 2,
            child:Container(
                  width: 400,
                  height: 10,
                  color: Colors.white,
                  child: const Center(
                      child: TextField(decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.https),
                    hintText: "Введите пароль",
                    )
                  ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                flex: 2,
                child: Container(
                  width: 400,
                  height: 10,
                  color: Colors.white,
                  child: const Center(
                    child: TextField(decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.local_post_office),
                        hintText: "Введите почту",
                        fillColor: Colors.white,
                        filled: true
                    )
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                flex: 2,
                child:Container(
                  width: 400,
                  height: 10,
                  color: Colors.white,
                  child: const Center(
                    child: TextField(decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.phone),
                        hintText: "Введите номер телефона",
                        fillColor: Colors.white,
                        filled: true
                    )
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 400,
                  height: 20,  
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Зарегистрироваться'
                ),
              ),
                ),
              ),
              const SizedBox(height: 35),
            ],
          )
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Приложение',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor:const  Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const AuthorizationRoute (),
    );
  }
}


//Главный экран с товарами
class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Center(
          child: Text('Главный экран'),
        ),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(productList[index].phoneImages, 
            width: 200, 
            height: 200
            ), 
            title: Text(
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              productList[index].phoneNames
              ), 
            subtitle: Text(
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              productList[index].price
              ), 
            onTap: () {
             Navigator.push( 
          context,
          MaterialPageRoute(
            builder: (context) => PhoneDetailScreen(
              name: productList[index].phoneNames,
              description: productList[index].phoneDescriptions,
              imagePath: productList[index].phoneImages,
              price: productList[index].price,
            ),
          ),
        );
            },
          );
        },
      ),
    );
  }
}




//Детальная информация о товаре
class PhoneDetailScreen extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;
  final String price;

  const PhoneDetailScreen({
    Key? key,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name), 
        centerTitle: true,
      ),
      body: SingleChildScrollView( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             const SizedBox(
              height: 20
             ), 
            Image.network(
              imagePath,
             width: 500, 
             height: 400
            ), 
            const SizedBox(
              height: 25
            ), 
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50
              ),
              child: Text(
                description, 
                style: const TextStyle(
                  fontSize: 20
                ), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class Product{
  String phoneNames;
  String phoneDescriptions;
  String phoneImages;
  String price;

 

  Product(this.phoneNames, this.phoneDescriptions, this.phoneImages, this.price);
}

List<Product> productList = [

  Product("Смартфон Apple iPhone 15 Pro Max 256GB Natural Titanium", 
  "Смартфон Apple iPhone 15 Pro Max Natural Titanium получил дисплей диагональю 6,7 дюйма, выполненный по технологии Super Retina XDR. Разрешение — 2796x1290 пикселей, яркость достигает 2000 кд/м², контрастность составляет 2000000:1 — изображение четкое, детализированное и насыщенное. Частота обновления 120 Гц обеспечивает плавность отображения любого динамичного контента. Экран защищает прочное стекло Ceramic Shield. В основе — шестиядерный процессор A17 Pro. Объем встроенной памяти для хранения данных — 256 Гб. Смартфон работает с nano-SIM и e-SIM в сетях вплоть до 5G. ",
  'https://img.mvideo.ru/Big/30069509bb.jpg',
  "149 999 ₽"
  ),

  Product("Смартфон Samsung Galaxy S24 Ultra 12/256GB Cobalt Violet", 
  "Смартфон Samsung Galaxy S24 Ultra 12/256GB Cobalt Violet дополнен искусственным интеллектом Galaxy AI, который позволяет быстро находить любые предметы с картинок в поиске Google, легко перемещать объекты на фотографиях и переводить речь на нужный язык во время разговора по телефону. Модель оснащена прочной титановой рамкой, устойчивой к ударам. Закаленное стекло защищает экран от царапин. Устройство можно погружать под воду на глубину до 1,5 м благодаря пылевлагозащите класса IP68.",
  'https://img.mvideo.ru/Big/30070490bb.jpg',
  "146 999 ₽"
  ),

  Product("Смартфон HONOR 90 LITE 8/256GB Silver", 
  "Смартфон Honor 90 Lite Silver обладает LCD-экраном диагональю 6,7 дюйма разрешением 1080x2388 пикселей. Восьмиядерный процессор Mediatek Dimensity 6020 в сочетании с 8 Гб оперативной памяти обеспечивает высокую производительность и стабильную работу, в том числе в режиме многозадачности. Объем встроенной памяти — 256 Гб. Смартфон работает на операционной системе Magic UI 7.1, основанной на Android 13. Поддерживаются стандарты связи вплоть до 5G. Доступна установка двух nano-SIM. Интегрированы модули: Wi-Fi для выхода в Сеть, NFC для бесконтактных платежей и других задач.",
  'https://img.mvideo.ru/Big/400205468bb.jpg',
  "22 999 ₽"
  ),

  Product("Смартфон Xiaomi Redmi 12 8/256GB Midnight Black", 
  "Смартфон Xiaomi 12 Midnight Black оснащен восьмиядерным процессором MediaTek Helio G88 частотой 2x2 ГГц + 6x1,8 ГГц. Объем оперативной памяти — 8 Гб, встроенной — 256 Гб. При необходимости хранилище можно расширить за счет карты microSD. Девайс работает на MIUI на базе ОС Android 13.",
  'https://img.mvideo.ru/Big/400161337bb.jpg',
  "14 499 ₽"
  ),

  Product("Смартфон Apple iPhone 15 Pro 128GB Natural Titanium", 
  "Смартфон Apple iPhone 15 Pro Natural Titanium (Dual Sim) получил дисплей диагональю 6,1 дюйма, выполненный по технологии Super Retina XDR. Разрешение — 2556x1179 пикселей, яркость достигает 2000 кд/м², контрастность составляет 2000000:1 — изображение четкое, детализированное и насыщенное. Частота обновления 120 Гц обеспечивает плавность отображения любого динамичного контента. Экран защищает прочное стекло Ceramic Shield. В основе — шестиядерный процессор A17 Pro.",
  'https://img.mvideo.ru/Big/30069473bb.jpg',
  "123 999 ₽"
  ),

  Product("Смартфон realme 11 8/128 GB Black",
   "Смартфон realme 11 (RMX3636) Black — модель с AMOLED-экраном диагональю 6,43 дюйма разрешением 2400x1080 пикселей, который демонстрирует яркое, насыщенное, детализированное изображение. ",
   'https://img.mvideo.ru/Big/400226783bb.jpg',
    "16 999 ₽"
   ),

  Product("Смартфон Xiaomi 14 12/256GB Jade Green",
   "Классический размер 6,36″ со сверхтонкими рамками. Оптика Leica Summilux с большой диафрагмой позволяет создавать более светлые, яркие и чёткие фотографии. Настроенный сенсор изображения Light Fusion 900 для высокого динамического диапазона 13,5 EV. Мобильная платформа Snapdragon® 8 Gen 3 обеспечивает ведущие показатели энергоэффективности.",
   'https://img.mvideo.ru/Big/400266794bb.jpg',
    "99 999 ₽"
   ),

   Product("Смартфон HUAWEI nova 11 pro 8/256GB Black",
   "Смартфон Huawei nova 11 pro Black оснащен 6,78-дюймовым безрамочным экраном разрешением 2652х1200 пикселей, произведенным с применением OLED-технологии. Отображается 1,07 млрд цветов. Частота обновления достигает 120 Гц и обеспечивает плавность прокрутки страниц и отображения любого динамичного контента. Объем оперативной памяти — 8 Гб, встроенной — 256 Гб. Модель работает на базе ОС Android с оболочкой EMUI 13.",
   'https://img.mvideo.ru/Big/400154555bb.jpg',
    "40 999 ₽"
   ),

   Product("Смартфон Infinix HOT 40i 8/256GB Black",
   "Смартфон Infinix HOT 40i Black оснащен большим 6,56-дюймовым IPS-экраном разрешением 1612х720 пикселей, на котором комфортно смотреть фото и видео, общаться в соцсетях, искать информацию в Сети, играть. Частота обновления 90 Гц способствует плавности прокрутки страниц. Экран защищает стекло Panda Glass.",
   'https://img.mvideo.ru/Big/400246912bb.jpg',
    "11 899 ₽"
   ),

   Product("Смартфон Samsung Galaxy A54 128GB Awesome Graphite",
   "Смартфон Samsung Galaxy A54 Awesome Graphite обладает большим экраном диагональю 6,4 дюйма разрешением 2340х1080 пикселей, на котором комфортно играть, смотреть фильмы и видеоролики, общаться в социальных сетях, решать рабочие задачи. ",
   'https://img.mvideo.ru/Big/30067380bb.jpg',
    "29 999 ₽"
   ),

   Product("Смартфон HONOR Magic V2 16/512GB Purple",
   "Смартфон Honor Magic V2 Purple — складная модель с двумя экранами: внешний обладает диагональю 6,43 дюйма и разрешением 2344x2156 пикселей, внутренний — 7,92 дюйма и 2376x1060 пикселей. Соотношение сторон составляет 20:9 и 9.78:9 соответственно. Оба дисплея выполнены по технологии OLED и плавно отображают любой динамичный контент благодаря частоте обновления 120 Гц. Сверхлегкий титановый каплевидный шарнир надежен и долговечен, позволяет зафиксировать экран под нужным углом.",
   'https://img.mvideo.ru/Pdb/400259094b.jpg',
    "159 999 ₽"
   ),

   Product("Смартфон Tecno POVA 5 8/256GB Hurricane Blue",
   "Смартфон Tecno LH7n Pova 5 Hurricane Blue — модель для решения повседневных задач, оснащенная большим TFT-дисплеем диагональю 6,8 дюйма. Разрешение 2460x1080 пикселей обеспечивает высокую детализацию, частота обновления 120 Гц отвечает за плавность прокрутки и отображения динамичного контента. ",
   'https://img.mvideo.ru/Big/400167384bb.jpg',
    "16 999 ₽"
   ),

   Product("Смартфон realme C51 4/128GB Black Carbon",
   "Смартфон realme C51 (RMX3830) Black Carbon оборудован восьмиядерным процессором Unisoc T612. Объем оперативной памяти составляет 4 Гб, встроенной для установки приложений и хранения файлов — 128 Гб. Ее можно увеличить за счет карты microSD (до 2048 Гб).",
   'https://img.mvideo.ru/Pdb/400185359b.jpg',
    "8 999 ₽"
   ),

   Product("Смартфон HONOR X9b 12/256GB Black",
   "Смартфон HONOR X9b оснащен 8-ядерным процессором и 12 ГБ оперативной памяти. Пользователи не ощутят промедлений при запуске требовательных приложений и организации работы в многозадачном режиме. Камера с 3 модулями поддерживает 3-кратный цифровой зум для приближения удаленных элементов без появления смазанных пикселей. Автоматическое создание кадра возможно в момент обнаружения улыбки. Выбрать настройки в зависимости от условий съемки позволяет профессиональный режим.",
   'https://img.mvideo.ru/Big/400256058bb.jpg',
    "30 999 ₽"
   ),

   Product("Смартфон Itel A17 DS 16+1GB Lake Blue",
   "Itel A17 – компактный смартфон, работающий под управлением Android Go. Это модель для нетребовательного пользователя, которому необходимо надёжное устройство для звонков и доступа в интернет.",
   'https://img.mvideo.ru/Big/30060639bb.jpg',
    "2 560 ₽"
   ),

];