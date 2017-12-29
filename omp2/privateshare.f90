implicit none
    integer::num_threads=4
    real::a,b
    b=1.0
    a=1.0
    !$omp parallel private(a) shared(b)
    !a=1.0
    print*,a,b
    !$omp end parallel
    end
    