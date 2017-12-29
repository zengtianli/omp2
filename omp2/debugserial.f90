!show how to use openmp or not with command !s
!all these can be defined at configuration manager    
    implicit none
    !$omp parallel
    print*,'hello'
     !$omp end parallel
   
    end
    