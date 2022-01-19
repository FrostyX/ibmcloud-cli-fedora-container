# Note that we use this script on s390x, so please never build the image
# elsewhere!

FROM fedora:35

RUN curl -fsSL https://clis.cloud.ibm.com/install/linux | sh \
    && ibmcloud plugin install vpc-infrastructure \
    && ibmcloud plugin install cloud-object-storage

RUN dnf -y install util-linux-core jq \
    && dnf clean all

COPY upload /usr/bin/upload-image
 
CMD upload-image
