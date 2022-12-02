#pragma once

#ifndef __CUDACC__
  #define __host__
  #define __device__
#endif

#define hostdev __host__ __device__