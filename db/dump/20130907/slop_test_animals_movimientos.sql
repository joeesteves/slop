CREATE DATABASE  IF NOT EXISTS `slop_test` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `slop_test`;
-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: slop_test
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `animals_movimientos`
--

DROP TABLE IF EXISTS `animals_movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animals_movimientos` (
  `animal_id` int(11) DEFAULT NULL,
  `movimiento_id` int(11) DEFAULT NULL,
  KEY `index_animals_movimientos_on_animal_id_and_movimiento_id` (`animal_id`,`movimiento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animals_movimientos`
--

LOCK TABLES `animals_movimientos` WRITE;
/*!40000 ALTER TABLE `animals_movimientos` DISABLE KEYS */;
INSERT INTO `animals_movimientos` VALUES (1324,167),(1324,171),(1324,185),(1325,167),(1325,171),(1325,185),(1326,167),(1326,171),(1326,185),(1327,167),(1327,171),(1327,194),(1328,167),(1328,171),(1328,194),(1329,167),(1329,171),(1329,194),(1330,167),(1330,171),(1330,194),(1331,167),(1331,171),(1331,195),(1332,167),(1332,171),(1332,196),(1333,167),(1333,171),(1333,197),(1334,167),(1334,171),(1334,198),(1335,167),(1335,171),(1335,199),(1336,167),(1336,171),(1336,200),(1337,167),(1337,171),(1337,201),(1338,167),(1338,171),(1338,183),(1339,167),(1339,171),(1339,183),(1340,167),(1340,171),(1340,183),(1341,167),(1341,171),(1341,183),(1342,167),(1342,171),(1342,183),(1343,167),(1343,171),(1343,183),(1344,167),(1344,171),(1344,183),(1345,167),(1345,171),(1345,202),(1346,167),(1346,171),(1346,203),(1347,167),(1347,171),(1347,204),(1348,167),(1348,171),(1348,204),(1349,167),(1349,171),(1349,204),(1350,167),(1350,171),(1350,204),(1351,167),(1351,171),(1351,204),(1352,167),(1352,171),(1352,204),(1353,167),(1353,171),(1353,204),(1354,167),(1354,171),(1354,204),(1355,167),(1355,171),(1355,204),(1356,167),(1356,171),(1356,204),(1357,167),(1357,171),(1357,204),(1358,167),(1358,171),(1358,205),(1359,167),(1359,171),(1359,205),(1360,167),(1360,171),(1360,205),(1361,167),(1361,171),(1361,205),(1362,167),(1362,171),(1362,205),(1363,167),(1363,171),(1363,205),(1364,167),(1364,171),(1364,205),(1365,167),(1365,171),(1365,205),(1366,167),(1366,171),(1366,205),(1367,167),(1367,171),(1367,205),(1368,167),(1368,171),(1368,205),(1369,167),(1369,171),(1369,214),(1370,167),(1370,171),(1370,214),(1371,167),(1371,171),(1371,214),(1372,167),(1372,171),(1372,214),(1373,167),(1373,171),(1373,214),(1374,167),(1374,171),(1374,214),(1375,167),(1375,171),(1375,214),(1376,167),(1376,171),(1376,214),(1377,167),(1377,171),(1377,214),(1378,167),(1378,171),(1378,214),(1379,167),(1379,171),(1379,214),(1380,167),(1380,171),(1380,214),(1381,167),(1381,171),(1381,214),(1382,167),(1382,171),(1382,214),(1383,167),(1383,171),(1383,214),(1384,167),(1384,171),(1384,214),(1385,167),(1385,171),(1385,214),(1386,167),(1386,171),(1386,214),(1387,167),(1387,171),(1387,214),(1388,167),(1388,171),(1388,214),(1389,167),(1389,171),(1389,214),(1390,167),(1390,171),(1390,214),(1391,167),(1391,171),(1391,214),(1392,167),(1392,171),(1392,214),(1393,167),(1393,171),(1393,214),(1394,167),(1394,171),(1394,214),(1395,167),(1395,171),(1395,214),(1396,167),(1396,171),(1396,214),(1397,167),(1397,171),(1397,214),(1398,167),(1398,171),(1398,214),(1399,167),(1399,171),(1399,214),(1400,167),(1400,171),(1400,214),(1401,167),(1401,171),(1401,214),(1402,167),(1402,171),(1402,214),(1403,167),(1403,171),(1403,214),(1404,167),(1404,171),(1404,214),(1405,167),(1405,171),(1405,214),(1406,167),(1406,171),(1406,214),(1407,167),(1407,171),(1407,214),(1408,167),(1408,171),(1408,214),(1409,167),(1409,171),(1409,214),(1410,167),(1410,171),(1410,214),(1411,167),(1411,171),(1411,214),(1412,167),(1412,171),(1412,214),(1413,167),(1413,171),(1413,214),(1414,167),(1414,171),(1414,214),(1415,167),(1415,171),(1415,214),(1416,167),(1416,171),(1416,214),(1417,167),(1417,171),(1417,214),(1418,167),(1418,171),(1418,214),(1419,167),(1419,171),(1419,214),(1420,167),(1420,171),(1420,214),(1421,167),(1421,171),(1421,214),(1422,167),(1422,171),(1422,214),(1423,167),(1423,171),(1423,214),(1424,167),(1424,171),(1424,214),(1425,167),(1425,171),(1425,214),(1426,167),(1426,171),(1426,214),(1427,167),(1427,171),(1427,214),(1428,167),(1428,171),(1428,214),(1429,167),(1429,171),(1429,214),(1430,167),(1430,171),(1430,214),(1431,167),(1431,171),(1431,214),(1432,167),(1432,171),(1432,214),(1433,167),(1433,171),(1433,214),(1434,167),(1434,172),(1434,186),(1435,167),(1435,172),(1435,186),(1436,167),(1436,172),(1436,186),(1437,167),(1437,172),(1437,186),(1438,167),(1438,172),(1438,186),(1439,167),(1439,172),(1439,186),(1440,167),(1440,173),(1440,214),(1441,167),(1441,173),(1441,214),(1442,167),(1442,173),(1442,214),(1443,167),(1443,173),(1443,214),(1444,167),(1444,173),(1444,214),(1445,167),(1445,173),(1445,214),(1446,167),(1446,173),(1446,214),(1447,167),(1447,173),(1447,214),(1448,167),(1448,173),(1448,214),(1449,167),(1449,173),(1449,214),(1450,167),(1450,173),(1450,214),(1451,167),(1451,173),(1451,214),(1452,168),(1452,173),(1452,214),(1453,168),(1453,173),(1453,214),(1454,168),(1454,173),(1454,214),(1455,168),(1455,173),(1455,214),(1456,168),(1456,173),(1456,214),(1457,168),(1457,173),(1457,214),(1458,168),(1458,173),(1458,214),(1459,168),(1459,173),(1459,214),(1460,168),(1460,173),(1460,214),(1461,168),(1461,173),(1461,214),(1462,168),(1462,173),(1462,214),(1463,168),(1463,173),(1463,214),(1464,168),(1464,173),(1464,214),(1465,168),(1465,173),(1465,214),(1466,168),(1466,173),(1466,214),(1467,168),(1467,173),(1467,214),(1468,168),(1468,173),(1468,214),(1469,168),(1469,173),(1469,214),(1470,168),(1470,173),(1470,214),(1471,168),(1471,173),(1471,214),(1472,168),(1472,173),(1472,214),(1473,168),(1473,173),(1473,214),(1474,168),(1474,173),(1474,214),(1475,168),(1475,173),(1475,214),(1476,168),(1476,173),(1476,214),(1477,168),(1477,173),(1477,214),(1478,168),(1478,173),(1478,214),(1479,168),(1479,173),(1479,214),(1480,168),(1480,173),(1480,214),(1481,168),(1481,173),(1481,214),(1482,168),(1482,173),(1482,214),(1483,168),(1483,173),(1483,214),(1484,168),(1484,173),(1484,214),(1485,168),(1485,173),(1485,214),(1486,168),(1486,173),(1486,214),(1487,168),(1487,173),(1487,214),(1488,168),(1488,173),(1488,214),(1489,168),(1489,173),(1489,214),(1490,168),(1490,173),(1490,214),(1491,168),(1491,173),(1491,214),(1492,168),(1492,173),(1492,214),(1493,168),(1493,173),(1493,214),(1494,168),(1494,173),(1494,214),(1495,168),(1495,173),(1495,214),(1496,168),(1496,173),(1496,214),(1497,168),(1497,173),(1497,214),(1498,168),(1498,173),(1498,214),(1499,168),(1499,173),(1499,214),(1500,168),(1500,173),(1500,214),(1501,168),(1501,173),(1501,214),(1502,168),(1502,173),(1502,214),(1503,168),(1503,173),(1503,214),(1504,168),(1504,173),(1504,214),(1505,168),(1505,173),(1506,168),(1506,174),(1506,186),(1507,168),(1507,174),(1507,186),(1508,168),(1508,174),(1508,186),(1509,168),(1509,174),(1509,186),(1510,168),(1510,174),(1510,186),(1511,168),(1511,175),(1511,182),(1512,168),(1512,175),(1512,182),(1513,168),(1513,175),(1513,182),(1514,168),(1514,175),(1514,182),(1515,168),(1515,175),(1515,182),(1516,168),(1516,175),(1516,182),(1517,168),(1517,175),(1517,182),(1518,168),(1518,175),(1518,182),(1519,168),(1519,175),(1519,182),(1520,168),(1520,175),(1520,182),(1521,168),(1521,175),(1521,182),(1522,168),(1522,175),(1522,184),(1523,168),(1523,176),(1524,168),(1524,176),(1525,168),(1525,176),(1526,168),(1526,176),(1527,168),(1527,176),(1528,168),(1528,176),(1529,168),(1529,176),(1530,168),(1530,176),(1531,168),(1531,176),(1532,168),(1532,176),(1533,168),(1533,176),(1534,168),(1534,176),(1535,169),(1535,177),(1536,169),(1536,177),(1537,169),(1537,177),(1538,169),(1538,177),(1539,169),(1539,177),(1540,169),(1540,177),(1541,169),(1541,177),(1542,169),(1542,177),(1543,169),(1543,177),(1544,169),(1544,177),(1545,169),(1545,177),(1546,169),(1546,177),(1547,169),(1547,177),(1548,169),(1548,177),(1549,169),(1549,177),(1550,169),(1550,177),(1551,169),(1551,177),(1552,169),(1552,177),(1553,169),(1553,177),(1554,169),(1554,177),(1555,169),(1555,177),(1556,169),(1556,177),(1557,169),(1557,177),(1558,169),(1558,178),(1559,169),(1559,178),(1560,169),(1560,178),(1561,169),(1561,178),(1562,170),(1562,179),(1563,170),(1563,179),(1564,170),(1564,179),(1565,170),(1565,179),(1566,170),(1566,179),(1567,170),(1567,179),(1568,170),(1568,179),(1569,170),(1569,179),(1570,170),(1570,179),(1571,170),(1571,179),(1572,170),(1572,179),(1573,170),(1573,179),(1574,170),(1574,179),(1575,170),(1575,179),(1576,170),(1576,179),(1577,170),(1577,179),(1578,170),(1578,179),(1579,170),(1579,179),(1580,170),(1580,179),(1581,170),(1581,180),(1582,170),(1582,180),(1583,170),(1583,180),(1584,170),(1584,180),(1585,170),(1585,180),(1586,170),(1586,180),(1587,170),(1587,180),(1588,170),(1588,180),(1589,170),(1589,180),(1590,170),(1590,180),(1591,170),(1591,180),(1592,170),(1593,187),(1594,187),(1595,187),(1596,187),(1597,187),(1598,187),(1599,187),(1600,187),(1601,187),(1602,187),(1603,187),(1604,187),(1605,187),(1606,187),(1607,187),(1608,187),(1609,187),(1610,187),(1611,187),(1612,187),(1613,187),(1614,187),(1615,187),(1616,187),(1617,187),(1618,187),(1619,187),(1620,187),(1621,187),(1622,187),(1623,187),(1624,187),(1625,187),(1626,187),(1627,187),(1628,187),(1629,187),(1630,187),(1631,187),(1632,187),(1633,187),(1634,187),(1635,187),(1636,187),(1637,187),(1638,187),(1639,187),(1640,187),(1641,187),(1642,187),(1643,187),(1644,187),(1645,187),(1646,187),(1647,187),(1648,187),(1649,187),(1650,187),(1651,187),(1652,187),(1653,187),(1654,187),(1655,187),(1656,187),(1657,187),(1658,187),(1659,187),(1660,187),(1661,187),(1662,187),(1663,187),(1664,187),(1665,188),(1666,188),(1667,188),(1675,193),(1676,193),(1677,193),(1678,193),(1679,206),(1680,206),(1681,206),(1682,207),(1683,208),(1684,208),(1685,209),(1686,210),(1687,210),(1688,210),(1689,210),(1690,211),(1691,211),(1692,212),(1693,213),(1694,213),(1695,213),(1696,213),(1697,213),(1698,213),(1699,213),(1700,213),(1701,213),(1702,213),(1703,213),(1704,213),(1705,213),(1706,213),(1707,213),(1708,213),(1709,213),(1710,213),(1711,213),(1712,213),(1713,213),(1714,213),(1715,213),(1716,213),(1717,213),(1718,213),(1719,213),(1720,213),(1721,213),(1722,213),(1723,213),(1724,213),(1725,213),(1726,213),(1727,213),(1728,213),(1729,213),(1730,213),(1731,213),(1732,213),(1733,213),(1734,213),(1735,213),(1736,213),(1737,213),(1738,213),(1739,213),(1740,213),(1741,213),(1742,213),(1743,213),(1744,213),(1745,213),(1746,213),(1747,213),(1748,213),(1749,213),(1750,213),(1751,213),(1752,213),(1753,213),(1754,213),(1755,213),(1756,213),(1757,213),(1758,213),(1759,213),(1760,213),(1761,213),(1762,213),(1763,213),(1764,213),(1765,213),(1766,213),(1767,213),(1768,213),(1769,213),(1770,213),(1771,213),(1772,213),(1773,213),(1774,213),(1775,213),(1776,213),(1777,213),(1778,213),(1779,213),(1780,213),(1781,213),(1782,213),(1783,213),(1784,213),(1785,213),(1786,213),(1787,213),(1788,213),(1789,213),(1790,213),(1791,213),(1792,213),(1793,213),(1794,213),(1795,213),(1796,213),(1797,213),(1798,213),(1799,213),(1800,213),(1801,213),(1802,213),(1803,213),(1804,213),(1805,213),(1806,213),(1807,213),(1808,213),(1809,213),(1810,213),(1811,213),(1812,213),(1813,213),(1814,213),(1815,213),(1816,213),(1817,213),(1818,213),(1819,213),(1820,213),(1821,213),(1822,213),(1823,215);
/*!40000 ALTER TABLE `animals_movimientos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-07 10:56:55
