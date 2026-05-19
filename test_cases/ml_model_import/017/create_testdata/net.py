"""Neural network import test generation"""

import torch
from torch import nn
from pysrc.ml_import_helper import make_yaml, test_nn


class Net(nn.Module):
    def __init__(self) -> None:
        super().__init__()
        self.layer1 = nn.AdaptiveAvgPool3d((3, 2, 1))

    def forward(self, net_input: torch.Tensor) -> torch.Tensor:
        x = self.layer1(net_input)
        return x


def ml_model_import_017(dir_save):
    net = Net()
    make_yaml(net, dir_save)
    test_nn(net, dir_save, None)
    return 0
