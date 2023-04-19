/*
 * Copyright (c) 2023 Biwesh Shrestha
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

import 'package:nepali_utils/nepali_utils.dart';

String indexToMonth(int index, Language language) =>
    NepaliDateFormat.MMMM(language).format(NepaliDateTime(0, index));

Map<int, List<int>> initializeDaysInMonths() {
  var daysInMonths = <int, List<int>>{};
  daysInMonths[2000] = [0, 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31];
  daysInMonths[2001] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2002] = [0, 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30];
  daysInMonths[2003] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31];
  daysInMonths[2004] = [0, 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31];
  daysInMonths[2005] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2006] = [0, 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30];
  daysInMonths[2007] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31];
  daysInMonths[2008] = [0, 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31];
  daysInMonths[2009] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2010] = [0, 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30];
  daysInMonths[2011] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31];
  daysInMonths[2012] = [0, 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30];
  daysInMonths[2013] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2014] = [0, 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30];
  daysInMonths[2015] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31];
  daysInMonths[2016] = [0, 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30];
  daysInMonths[2017] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2018] = [0, 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30];
  daysInMonths[2019] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31];
  daysInMonths[2020] = [0, 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2021] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2022] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30];
  daysInMonths[2023] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31];
  daysInMonths[2024] = [0, 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2025] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2026] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31];
  daysInMonths[2027] = [0, 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31];
  daysInMonths[2028] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2029] = [0, 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30];
  daysInMonths[2030] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31];
  daysInMonths[2031] = [0, 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31];
  daysInMonths[2032] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2033] = [0, 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30];
  daysInMonths[2034] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31];
  daysInMonths[2035] = [0, 30, 32, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31];
  daysInMonths[2036] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2037] = [0, 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30];
  daysInMonths[2038] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31];
  daysInMonths[2039] = [0, 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30];
  daysInMonths[2040] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2041] = [0, 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30];
  daysInMonths[2042] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31];
  daysInMonths[2043] = [0, 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30];
  daysInMonths[2044] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2045] = [0, 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30];
  daysInMonths[2046] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31];
  daysInMonths[2047] = [0, 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2048] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2049] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30];
  daysInMonths[2050] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31];
  daysInMonths[2051] = [0, 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2052] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2053] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30];
  daysInMonths[2054] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31];
  daysInMonths[2055] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2056] = [0, 31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30];
  daysInMonths[2057] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31];
  daysInMonths[2058] = [0, 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31];
  daysInMonths[2059] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2060] = [0, 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30];
  daysInMonths[2061] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31];
  daysInMonths[2062] = [0, 30, 32, 31, 32, 31, 31, 29, 30, 29, 30, 29, 31];
  daysInMonths[2063] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2064] = [0, 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30];
  daysInMonths[2065] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31];
  daysInMonths[2066] = [0, 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31];
  daysInMonths[2067] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2068] = [0, 31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30];
  daysInMonths[2069] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31];
  daysInMonths[2070] = [0, 31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30];
  daysInMonths[2071] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2072] = [0, 31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30];
  daysInMonths[2073] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31];
  daysInMonths[2074] = [0, 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2075] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2076] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30];
  daysInMonths[2077] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31];
  daysInMonths[2078] = [0, 31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2079] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30];
  daysInMonths[2080] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30];
  daysInMonths[2081] = [0, 31, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30];
  daysInMonths[2082] = [0, 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30];
  daysInMonths[2083] = [0, 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30];
  daysInMonths[2084] = [0, 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30];
  daysInMonths[2085] = [0, 31, 32, 31, 32, 30, 31, 30, 30, 29, 30, 30, 30];
  daysInMonths[2086] = [0, 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30];
  daysInMonths[2087] = [0, 31, 31, 32, 31, 31, 31, 30, 30, 29, 30, 30, 30];
  daysInMonths[2088] = [0, 30, 31, 32, 32, 30, 31, 30, 30, 29, 30, 30, 30];
  daysInMonths[2089] = [0, 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30];
  daysInMonths[2090] = [0, 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30];
  daysInMonths[2091] = [0, 31, 31, 32, 31, 31, 31, 30, 30, 29, 30, 30, 30];
  daysInMonths[2092] = [0, 30, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30];
  daysInMonths[2093] = [0, 30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30];
  daysInMonths[2094] = [0, 31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30];
  daysInMonths[2095] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 30, 30, 30, 30];
  daysInMonths[2096] = [0, 30, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30];
  daysInMonths[2097] = [0, 31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30];
  daysInMonths[2098] = [0, 31, 31, 32, 31, 31, 31, 29, 30, 29, 30, 29, 31];
  daysInMonths[2099] = [0, 31, 31, 32, 31, 31, 31, 30, 29, 29, 30, 30, 30];
  return daysInMonths;
}
