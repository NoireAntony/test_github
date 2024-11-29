-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 29 2024 г., 19:52
-- Версия сервера: 5.7.39-log
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `warehouse`
--

-- --------------------------------------------------------

--
-- Структура таблицы `tovar`
--

CREATE TABLE `tovar` (
  `id_tovar` int(11) NOT NULL,
  `name_tovar` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opisainie` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cena` int(11) NOT NULL,
  `img` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tovar`
--

INSERT INTO `tovar` (`id_tovar`, `name_tovar`, `opisainie`, `cena`, `img`) VALUES
(1, 'Продуктовый набор 1', 'Огурцы, бананы, лимон, капуста, сыр', 1100, 'img/1.jpg'),
(2, 'Продуктовый набор 2', 'Хлеб, масло, помидоры', 300, 'img/2.png'),
(3, 'Продуктовый набор 3', 'Сыр,  сливочное масло, молоко', 500, 'img/3.jpg'),
(4, 'Продуктовый набор 4', 'хлеб', 100, 'img/4.jpg'),
(5, 'Продуктовый набор 5', 'яйца, сыр, воду,  хлеб, бургеры, огурцы, яблока, картофель, морковка, капуста, банан, перец, колбаса  ', 2000, 'img/5.jpg'),
(6, 'Продуктовый набор 6', 'Масло, молоко, кефир, хлеб, курица', 700, 'img/6.jpg'),
(7, 'Продуктовый набор 7', 'Яблоки', 200, 'img/7.jpg'),
(8, 'Продуктовый набор 8', 'Гречка, курица, огурцы, киви', 800, 'img/8.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `fio` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `fio`, `login`, `password`, `tel`, `email`) VALUES
(1, 'Крылов А.Т', 'sklad', '123qwe', '+79234578876', 'krl@mail.ru'),
(2, 'Петров А.Т', 'petr', 'pet123', '76543322190', 'pet@mail.ru'),
(3, 'Лукьянов ', '0', '222', '+79145763216', 'luk@mail.ru'),
(4, 'rtyu', 'pyyr', '12345', '7654327', 'noire@mail.ru'),
(5, 'Романов К', 'admin', '12345', '2345678', 'serov@mail.ru'),
(6, 'Петров Пётр', 'manager', '12', '2345678', 'petr@mail.ru'),
(7, 'Петров Пётр', 'ivan', '12', '79145763216', 'gorb@mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `zakaz`
--

CREATE TABLE `zakaz` (
  `Id_zakaz` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_tovar` int(11) DEFAULT NULL,
  `col` int(20) NOT NULL,
  `date_zakaza` date DEFAULT NULL,
  `adres_dostavki` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `zakaz`
--

INSERT INTO `zakaz` (`Id_zakaz`, `id_user`, `id_tovar`, `col`, `date_zakaza`, `adres_dostavki`, `status`) VALUES
(1, 1, 3, 4, '2023-03-20', 'мира 6', ' отправлен'),
(2, 2, 3, 1, '2024-11-13', 'мира 5', 'отправлен'),
(3, 1, 3, 1, '2023-03-20', '1 линия', ' отправлен'),
(9, 3, 6, 300, '2024-11-14', '20 линия', 'отправлен'),
(10, 5, 7, 3, '2024-11-14', '10 линия', 'отправлен'),
(11, 4, 4, 2, '2024-11-14', '10 линия', 'отправлен'),
(22, 2, 1, 200, '2024-11-21', '10 линия 6', 'оплачено'),
(23, 2, 1, 100, '2024-11-04', '20 линия', 'оплачено'),
(24, 2, 1, 300, '2024-11-19', '1майская', 'оплачено');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `tovar`
--
ALTER TABLE `tovar`
  ADD PRIMARY KEY (`id_tovar`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Индексы таблицы `zakaz`
--
ALTER TABLE `zakaz`
  ADD PRIMARY KEY (`Id_zakaz`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_tovar` (`id_tovar`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `tovar`
--
ALTER TABLE `tovar`
  MODIFY `id_tovar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `zakaz`
--
ALTER TABLE `zakaz`
  MODIFY `Id_zakaz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `zakaz`
--
ALTER TABLE `zakaz`
  ADD CONSTRAINT `zakaz_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zakaz_ibfk_2` FOREIGN KEY (`id_tovar`) REFERENCES `tovar` (`id_tovar`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
