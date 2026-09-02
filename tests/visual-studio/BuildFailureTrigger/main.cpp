#include <iostream>

#ifdef DESKPET_INTENTIONAL_BUILD_FAILURE
#error DeskPet test: intentional build failure. Select Debug or Release to build successfully.
#endif

int main()
{
    std::cout << "BuildFailureTrigger built successfully. Select FailBuild|x64 to test DeskPet's BuildFailed event.\n"
    return 0;
}
